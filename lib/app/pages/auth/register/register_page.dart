// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_week/app/core/ui/styles/text_styles.dart';
import 'package:dart_week/app/core/ui/widgets/button.dart';
import 'package:dart_week/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:dart_week/app/pages/auth/register/view/register_view_impl.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 106.82,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bola.png"), fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Cadastrar Usuário",
                  style: context.textStyles.titleBlack,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          label: Text("Nome Completo *"),
                        ),
                        validator: Validatorless.required("Obrigatório"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("E-mail *"),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required("Obrigatório"),
                          Validatorless.email("E-mail inválido")
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text("Senha *"),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required("Obrigatório"),
                          Validatorless.min(6, "Senha deve conter pelo menos 6 caracteres")
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text("Confirma senha *"),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required("Obrigatório"),
                          Validatorless.min(6, "Senha deve conter pelo menos 6 caracteres"),
                          Validatorless.compare(
                              passwordController, "Senha diferente de confirma senha")
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Button.primary(
                        onPressed: () {
                          final formValid = formKey.currentState?.validate() ?? false;

                          if (formValid) {
                            showLoader();
                            widget.presenter.register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            );
                          }
                        },
                        width: MediaQuery.of(context).size.width * .9,
                        label: "Cadastrar",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
