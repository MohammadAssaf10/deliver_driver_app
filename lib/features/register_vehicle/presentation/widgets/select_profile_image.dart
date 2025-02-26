// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/theming/colors_manager.dart';
// import '../../../../core/utils/app_dialogs.dart';
// import '../../../../generated/assets.dart';
// import '../bloc/register_vehicle_bloc.dart';
// import '../bloc/register_vehicle_state.dart';
//
// class SelectProfileImage extends StatelessWidget {
//   const SelectProfileImage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterVehicleBloc, RegisterVehicleState>(
//       builder: (context, state) {
//         return GestureDetector(
//           onTap: () {
//             showImageSourceDialog(context, (imageSource) {
//               context
//                   .read<RegisterVehicleBloc>()
//                   .selectProfileImage(imageSource);
//             });
//           },
//           child: Stack(
//             children: [
//               Container(
//                 height: 120,
//                 width: 120,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: ColorsManager.grey),
//                   image: state.profileImage != null
//                       ? DecorationImage(
//                           image: FileImage(File(state.profileImage!.path)),
//                           fit: BoxFit.cover,
//                         )
//                       : const DecorationImage(
//                           image: AssetImage(Assets.iconsDriverIcon),
//                           colorFilter: ColorFilter.mode(
//                             ColorsManager.grey,
//                             BlendMode.srcIn,
//                           ),
//                         ),
//                 ),
//               ),
//               PositionedDirectional(
//                 bottom: 0,
//                 end: 10,
//                 child: Container(
//                   height: 30,
//                   width: 30,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: ColorsManager.darkGrey,
//                   ),
//                   child: const Icon(
//                     Icons.camera_alt,
//                     color: ColorsManager.lightGrey,
//                     size: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
