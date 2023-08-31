import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/widgets/hours_panel.dart';
import '../../../../core/ui/widgets/weed_days_panel.dart';
import 'barbershop_register_state.dart';
import 'barbershop_register_vm.dart';

class BarbershopRegisterPage extends ConsumerStatefulWidget {
  const BarbershopRegisterPage({super.key});

  @override
  ConsumerState<BarbershopRegisterPage> createState() => _BarbershopRegisterPageState();
}

class _BarbershopRegisterPageState extends ConsumerState<BarbershopRegisterPage> {
  final key = GlobalKey<FormState>();
  final nameEc = TextEditingController();
  final emailEc = TextEditingController();

  @override
  void dispose() {
    nameEc.dispose();
    emailEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbershopRegisterVm = ref.watch(barbershopRegisterVmProvider.notifier);

    ref.listen(barbershopRegisterVmProvider, (_, state) {
      switch (state.status) {
        case BarbershopRegisterVmStatus.initial:
          break;
        case BarbershopRegisterVmStatus.error:
          Messages.showError(context, 'Desculpe, ocorreu um erro ao registrar barbearia');
        case BarbershopRegisterVmStatus.success:
          Navigator.of(context).pushNamedAndRemoveUntil('/home/adm', (route) => false);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar estabelecimento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: nameEc,
                  validator: Validatorless.required('Nome obrigatório'),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailEc,
                  validator: Validatorless.multiple([
                    Validatorless.required('Email obrigatório'),
                    Validatorless.email('Email Inválido'),
                  ]),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(height: 24),
                WeedDaysPanel(
                  onTapDay: (v) {
                    barbershopRegisterVm.addOrRemoveOpenDay(v);
                  },
                ),
                const SizedBox(height: 24),
                HoursPanel(
                  startTime: 6,
                  endTime: 23,
                  onTapHour: (v) {
                    barbershopRegisterVm.addOrRemoveOpenHours(v);
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    switch (key.currentState?.validate()) {
                      case false || null:
                        Messages.showError(context, 'Formulário Inválido');
                      case true:
                        barbershopRegisterVm.register(nameEc.text, emailEc.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: const Text('CADASTRAR ESTABELECIMENTO'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
