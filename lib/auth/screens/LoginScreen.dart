import 'package:codyon/common/constants/colors.dart';
import 'package:codyon/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _onSubmit() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    print(_formKey.currentState!.instantValue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("로그인"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 25,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "원하는 스타일의\n완벽한 발견",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                SvgPicture.asset("assets/icons/logo_text.svg"),
                const SizedBox(height: 40),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      const EmailFormField(),
                      const SizedBox(height: 40),
                      const _PasswordFormField(),
                      const SizedBox(height: 40),
                      _SubmitButton(
                        onSubmit: _onSubmit,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const _OtherActions(),
                const SizedBox(height: 66),
                const _SnsLoginDivider(),
                const SizedBox(height: 26),
                const _SnsLoginProviders(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "email",
      style: const TextStyle(fontSize: 13),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(errorText: "이메일을 입력해주세요."),
          FormBuilderValidators.email(errorText: "이메일 형식에 맞게 입력해주세요.")
        ],
      ),
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: GRAY_200),
        hintText: "아이디 입력",
        prefixIcon: Icon(
          Icons.person_outline,
        ),
      ),
    );
  }
}

class _PasswordFormField extends StatefulWidget {
  const _PasswordFormField();

  @override
  State<_PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<_PasswordFormField> {
  bool obscure = true;

  void toggleObscure() => setState(() => obscure = !obscure);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: obscure,
      name: "password",
      style: const TextStyle(fontSize: 13),
      validator: FormBuilderValidators.required(errorText: "비밀번호를 입력해주세요."),
      decoration: InputDecoration(
        hintText: "비밀번호 입력",
        hintStyle: const TextStyle(color: GRAY_200),
        prefixIcon: const Icon(
          Icons.lock_outline,
        ),
        suffixIcon: GestureDetector(
          onTap: toggleObscure,
          child: const Icon(
            Icons.remove_red_eye,
          ),
        ),
      ),
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
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF16182C),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: const Text("로그인"),
    );
  }
}

class _OtherActions extends StatelessWidget {
  const _OtherActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "아이디 찾기",
          style: TextStyle(color: GRAY_600),
        ),
        _renderDivider(),
        const Text(
          "비밀번호 찾기",
          style: TextStyle(color: GRAY_600),
        ),
        _renderDivider(),
        const Text(
          "회원가입",
          style: TextStyle(color: GRAY_600),
        ),
      ].withSpaceBetween(width: 12),
    );
  }

  Widget _renderDivider() {
    return Container(
      width: 1,
      height: 12,
      decoration: const BoxDecoration(
        color: Color(0xffc9cdd2),
      ),
    );
  }
}

class _SnsLoginDivider extends StatelessWidget {
  const _SnsLoginDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _renderDivider(),
        const Text(
          "SNS 계정으로 로그인",
          style: TextStyle(
            color: GRAY_400,
          ),
        ),
        _renderDivider(),
      ].withSpaceBetween(width: 10),
    );
  }

  Widget _renderDivider() {
    return Expanded(
      child: Container(
        height: 1,
        decoration: const BoxDecoration(
          color: Color(0xffd9d9d9),
        ),
      ),
    );
  }
}

class _SnsLoginProviders extends StatelessWidget {
  const _SnsLoginProviders();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/icons/naver_login_logo.svg"),
        SvgPicture.asset("assets/icons/kakao_login_logo.svg"),
        SvgPicture.asset("assets/icons/google_login_logo.svg"),
        SvgPicture.asset("assets/icons/facebook_login_logo.svg"),
        SvgPicture.asset("assets/icons/apple_login_logo.svg"),
      ],
    );
  }
}
