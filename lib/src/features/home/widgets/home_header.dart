import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/application_providers.dart';
import '../../../core/ui/barbershop_icons.dart';
import '../../../core/ui/constants.dart';

class HomeHeader extends ConsumerWidget {
  final bool hideFilter;
  const HomeHeader({
    super.key,
    this.hideFilter = false,
  });
  const HomeHeader.withoutFilter({
    super.key,
    this.hideFilter = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barbershop = ref.watch(getMyBarbershopProvider);
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage(AppAssets.backgroundChair), fit: BoxFit.cover, opacity: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.greyLight,
                child: SizedBox.shrink(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  barbershop.maybeWhen(data: (data) {
                    return data.name;
                  }, orElse: () {
                    return 'Barbershop loading error';
                  }),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'editar',
                style: TextStyle(
                  color: AppColors.brown,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  BarbershopIcons.exit,
                  color: AppColors.brown,
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Bem vindo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Agende um cliente',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          Offstage(
            offstage: hideFilter,
            child: const SizedBox(height: 24),
          ),
          Offstage(
            offstage: hideFilter,
            child: TextFormField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                label: Text('Buscar Colaborador'),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Icon(
                    BarbershopIcons.search,
                    color: AppColors.brown,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
