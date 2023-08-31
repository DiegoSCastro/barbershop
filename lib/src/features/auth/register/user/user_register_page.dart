import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/form_helper.dart';
import '../../../../core/ui/helpers/messages.dart';
import 'user_register_vm.dart';

class UserRegisterPage extends ConsumerStatefulWidget {
  const UserRegisterPage({super.key});

  @override
  ConsumerState<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends ConsumerState<UserRegisterPage> {
  final key = GlobalKey<FormState>();
  final nameEc = TextEditingController();
  final emailEc = TextEditingController();
  final passwordEc = TextEditingController();
  final confirmPasswordEc = TextEditingController();

  @override
  void dispose() {
    nameEc.dispose();
    emailEc.dispose();
    passwordEc.dispose();
    confirmPasswordEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRegisterVm = ref.watch(userRegisterVmProvider.notifier);
    ref.listen(userRegisterVmProvider, (_, state) {
      switch (state) {
        case UserRegisterVmStatus.initial:
          break;
        case UserRegisterVmStatus.success:
          Navigator.of(context).pushNamed('/auth/register/barbershop');
        case UserRegisterVmStatus.error:
          Messages.showError(context, 'Erro ao registrar usuário administrador');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserRegisterPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                  controller: nameEc,
                  onTapOutside: (_) => context.unFocus(),
                  validator: Validatorless.required('Nome obrigatório'),
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailEc,
                  onTapOutside: (_) => context.unFocus(),
                  validator: Validatorless.multiple([
                    Validatorless.required('Nome obrigatório'),
                    Validatorless.email('Email inválido')
                  ]),
                  decoration: const InputDecoration(
                    label: Text('E-mail'),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: passwordEc,
                  onTapOutside: (_) => context.unFocus(),
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha Obrigatória'),
                    Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
                  ]),
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: confirmPasswordEc,
                  onTapOutside: (_) => context.unFocus(),
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirma senha Obrigatório'),
                    Validatorless.compare(passwordEc, 'As senhas devem ser iguais'),
                  ]),
                  decoration: const InputDecoration(
                    label: Text('Confirmar Senha'),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    switch (key.currentState?.validate()) {
                      case false || null:
                        Messages.showError(context, 'Formulário inválido');
                      case true:
                        userRegisterVm.register(
                          name: nameEc.text,
                          email: emailEc.text,
                          password: passwordEc.text,
                        );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: const Text('CRIAR CONTA'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
