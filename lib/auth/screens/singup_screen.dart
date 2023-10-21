import 'package:codyon/common/constants/colors.dart';
import 'package:codyon/common/layout/default_layout.dart';
import 'package:codyon/extensions.dart';
import 'package:codyon/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "회원가입",
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: _SubmitButton(
          onSubmit: () => context.goNamed(Routes.home.name),
        ),
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...[
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SignUpFormField(
                        name: "email",
                        label: "이메일",
                        hintText: "이메일을 입력하세요",
                      ),
                    ),
                    SizedBox(width: 10),
                    _ActionButton("중복확인")
                  ],
                ),
                const SignUpFormField(
                  name: "password",
                  label: "비밀번호",
                  hintText: "영문,숫자,특수문자 포함 9자 이상을 입력하세요",
                ),
                const SignUpFormField(
                  name: "",
                  label: "비밀번호 확인",
                  hintText: "비밀번호를 다시 입력하세요",
                ),
              ].withSpaceBetween(height: 20),
              const SizedBox(height: 70),
              ...[
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SignUpFormField(
                        name: "phone",
                        label: "휴대폰 번호",
                        hintText: "'-'를 제외한 숫자를 입력하세요",
                      ),
                    ),
                    SizedBox(width: 10),
                    _ActionButton("인증번호 발송")
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SignUpFormField(
                        name: "otp-code",
                        label: "인증번호",
                      ),
                    ),
                    SizedBox(width: 10),
                    _ActionButton("확인")
                  ],
                ),
              ].withSpaceBetween(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFormField extends StatelessWidget {
  final String name;
  final String? label, hintText;

  const SignUpFormField({
    super.key,
    this.label,
    this.hintText,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF0C0C0C),
        width: 1,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0C0C0C),
            ),
          ),
          const SizedBox(height: 8),
        ],
        FormBuilderTextField(
          name: name,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: const TextStyle(color: GRAY_200),
            border: baseBorder,
            enabledBorder: baseBorder,
            focusedBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide.copyWith(
                color: Colors.deepPurple,
              ),
            ),
            errorStyle: const TextStyle(fontSize: 11),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
          ),
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;

  const _SubmitButton({
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "button",
      child: ElevatedButton(
        onPressed: onSubmit,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF16182C),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: const Text("확인"),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;

  const _ActionButton(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(63, 54),
        backgroundColor: const Color(0xFFF7F8F9),
        foregroundColor: GRAY_500,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        elevation: 0,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
