import 'package:chrip_aid/common/utils/snack_bar_util.dart';
import 'package:chrip_aid/member/model/dto/edit_orphanage_member_info_request_dto.dart';
import 'package:chrip_aid/member/model/entity/orphanage_member_entity.dart';
import 'package:chrip_aid/member/model/service/member_info_service.dart';
import 'package:chrip_aid/member/model/state/member_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final editOrphanageMemberInfoViewModelProvider =
    ChangeNotifierProvider((ref) => EditUserInfoViewModel(ref));

class EditUserInfoViewModel extends ChangeNotifier {
  final Ref ref;

  late final TextEditingController nameTextController;
  late final TextEditingController passwordTextController;
  late final TextEditingController checkPasswordTextController;

  late final MemberInfoService _memberInfoService;

  MemberInfoState get userInfoState => _memberInfoService.memberInfoState;

  OrphanageMemberEntity? get userInfo => userInfoState.value as OrphanageMemberEntity?;

  EditUserInfoViewModel(this.ref) {
    _memberInfoService = ref.read(memberInfoServiceProvider);
    userInfoState.addListener(notifyListeners);

    nameTextController = TextEditingController(text: userInfo!.name);
    passwordTextController = TextEditingController();
    checkPasswordTextController = TextEditingController();
  }

  void editUserInfo(BuildContext context) async {
    if (passwordTextController.text != checkPasswordTextController.text) {
      return SnackBarUtil.showError("비밀번호가 일치하지 않습니다.");
    }
    await _memberInfoService.editMemberInfo(
      EditOrphanageMemberInfoRequestDto(
        name: nameTextController.text,
        password: passwordTextController.text,
      ),
    );
    if (context.mounted) context.pop();
  }
}
