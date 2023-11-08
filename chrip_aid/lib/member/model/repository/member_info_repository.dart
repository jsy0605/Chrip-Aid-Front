import 'package:chrip_aid/common/dio/dio.dart';
import 'package:chrip_aid/member/model/dto/edit_member_info_request_dto.dart';
import 'package:chrip_aid/member/model/entity/member_entity.dart';
import 'package:chrip_aid/member/model/repository/member_info_repository.stub.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'member_info_repository.g.dart';

final memberInfoRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return MemberInfoRepositoryStub(ref);
  return MemberInfoRepository(dio);
});

@RestApi()
abstract class MemberInfoRepository {
  factory MemberInfoRepository(Dio dio, {String? baseUrl}) = _MemberInfoRepository;

  @PUT('/members/users/info')
  Future editUserInfo(EditMemberInfoRequestDto entity);

  @GET('/members/users/info')
  @Headers({'accessToken' : 'true'})
  Future<MemberEntity> getUserInfo();
}
