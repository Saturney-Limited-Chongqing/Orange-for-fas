// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DomainTicket _$DomainTicketFromJson(Map<String, dynamic> json) {
  return _DomainTicket.fromJson(json);
}

/// @nodoc
mixin _$DomainTicket {
  /// 工单 ID
  int get id => throw _privateConstructorUsedError;

  /// 标题
  String get subject => throw _privateConstructorUsedError;

  /// 优先级（低=0, 中=1, 高=2）
  int get priority => throw _privateConstructorUsedError;

  /// 状态
  TicketStatus get status => throw _privateConstructorUsedError;

  /// 消息列表
  List<TicketMessage> get messages => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 关闭时间
  DateTime? get closedAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this DomainTicket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DomainTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DomainTicketCopyWith<DomainTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainTicketCopyWith<$Res> {
  factory $DomainTicketCopyWith(
          DomainTicket value, $Res Function(DomainTicket) then) =
      _$DomainTicketCopyWithImpl<$Res, DomainTicket>;
  @useResult
  $Res call(
      {int id,
      String subject,
      int priority,
      TicketStatus status,
      List<TicketMessage> messages,
      DateTime createdAt,
      DateTime? updatedAt,
      DateTime? closedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DomainTicketCopyWithImpl<$Res, $Val extends DomainTicket>
    implements $DomainTicketCopyWith<$Res> {
  _$DomainTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DomainTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? priority = null,
    Object? status = null,
    Object? messages = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? closedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TicketMessage>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainTicketImplCopyWith<$Res>
    implements $DomainTicketCopyWith<$Res> {
  factory _$$DomainTicketImplCopyWith(
          _$DomainTicketImpl value, $Res Function(_$DomainTicketImpl) then) =
      __$$DomainTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String subject,
      int priority,
      TicketStatus status,
      List<TicketMessage> messages,
      DateTime createdAt,
      DateTime? updatedAt,
      DateTime? closedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DomainTicketImplCopyWithImpl<$Res>
    extends _$DomainTicketCopyWithImpl<$Res, _$DomainTicketImpl>
    implements _$$DomainTicketImplCopyWith<$Res> {
  __$$DomainTicketImplCopyWithImpl(
      _$DomainTicketImpl _value, $Res Function(_$DomainTicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of DomainTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? priority = null,
    Object? status = null,
    Object? messages = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? closedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$DomainTicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TicketMessage>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainTicketImpl extends _DomainTicket {
  const _$DomainTicketImpl(
      {required this.id,
      required this.subject,
      this.priority = 1,
      required this.status,
      final List<TicketMessage> messages = const [],
      required this.createdAt,
      this.updatedAt,
      this.closedAt,
      final Map<String, dynamic> metadata = const {}})
      : _messages = messages,
        _metadata = metadata,
        super._();

  factory _$DomainTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainTicketImplFromJson(json);

  /// 工单 ID
  @override
  final int id;

  /// 标题
  @override
  final String subject;

  /// 优先级（低=0, 中=1, 高=2）
  @override
  @JsonKey()
  final int priority;

  /// 状态
  @override
  final TicketStatus status;

  /// 消息列表
  final List<TicketMessage> _messages;

  /// 消息列表
  @override
  @JsonKey()
  List<TicketMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime? updatedAt;

  /// 关闭时间
  @override
  final DateTime? closedAt;

  /// 元数据
  final Map<String, dynamic> _metadata;

  /// 元数据
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'DomainTicket(id: $id, subject: $subject, priority: $priority, status: $status, messages: $messages, createdAt: $createdAt, updatedAt: $updatedAt, closedAt: $closedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainTicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subject,
      priority,
      status,
      const DeepCollectionEquality().hash(_messages),
      createdAt,
      updatedAt,
      closedAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of DomainTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainTicketImplCopyWith<_$DomainTicketImpl> get copyWith =>
      __$$DomainTicketImplCopyWithImpl<_$DomainTicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainTicketImplToJson(
      this,
    );
  }
}

abstract class _DomainTicket extends DomainTicket {
  const factory _DomainTicket(
      {required final int id,
      required final String subject,
      final int priority,
      required final TicketStatus status,
      final List<TicketMessage> messages,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final DateTime? closedAt,
      final Map<String, dynamic> metadata}) = _$DomainTicketImpl;
  const _DomainTicket._() : super._();

  factory _DomainTicket.fromJson(Map<String, dynamic> json) =
      _$DomainTicketImpl.fromJson;

  /// 工单 ID
  @override
  int get id;

  /// 标题
  @override
  String get subject;

  /// 优先级（低=0, 中=1, 高=2）
  @override
  int get priority;

  /// 状态
  @override
  TicketStatus get status;

  /// 消息列表
  @override
  List<TicketMessage> get messages;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime? get updatedAt;

  /// 关闭时间
  @override
  DateTime? get closedAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of DomainTicket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DomainTicketImplCopyWith<_$DomainTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketMessage _$TicketMessageFromJson(Map<String, dynamic> json) {
  return _TicketMessage.fromJson(json);
}

/// @nodoc
mixin _$TicketMessage {
  /// 消息 ID
  int get id => throw _privateConstructorUsedError;

  /// 消息内容
  String get content => throw _privateConstructorUsedError;

  /// 是否来自用户
  bool get isFromUser => throw _privateConstructorUsedError;

  /// 是否已读
  bool get isRead => throw _privateConstructorUsedError;

  /// 附件列表
  List<String> get attachments => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 元数据
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this TicketMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketMessageCopyWith<TicketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketMessageCopyWith<$Res> {
  factory $TicketMessageCopyWith(
          TicketMessage value, $Res Function(TicketMessage) then) =
      _$TicketMessageCopyWithImpl<$Res, TicketMessage>;
  @useResult
  $Res call(
      {int id,
      String content,
      bool isFromUser,
      bool isRead,
      List<String> attachments,
      DateTime createdAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$TicketMessageCopyWithImpl<$Res, $Val extends TicketMessage>
    implements $TicketMessageCopyWith<$Res> {
  _$TicketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isFromUser = null,
    Object? isRead = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isFromUser: null == isFromUser
          ? _value.isFromUser
          : isFromUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketMessageImplCopyWith<$Res>
    implements $TicketMessageCopyWith<$Res> {
  factory _$$TicketMessageImplCopyWith(
          _$TicketMessageImpl value, $Res Function(_$TicketMessageImpl) then) =
      __$$TicketMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      bool isFromUser,
      bool isRead,
      List<String> attachments,
      DateTime createdAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$TicketMessageImplCopyWithImpl<$Res>
    extends _$TicketMessageCopyWithImpl<$Res, _$TicketMessageImpl>
    implements _$$TicketMessageImplCopyWith<$Res> {
  __$$TicketMessageImplCopyWithImpl(
      _$TicketMessageImpl _value, $Res Function(_$TicketMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? isFromUser = null,
    Object? isRead = null,
    Object? attachments = null,
    Object? createdAt = null,
    Object? metadata = null,
  }) {
    return _then(_$TicketMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isFromUser: null == isFromUser
          ? _value.isFromUser
          : isFromUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketMessageImpl extends _TicketMessage {
  const _$TicketMessageImpl(
      {required this.id,
      required this.content,
      this.isFromUser = true,
      this.isRead = false,
      final List<String> attachments = const [],
      required this.createdAt,
      final Map<String, dynamic> metadata = const {}})
      : _attachments = attachments,
        _metadata = metadata,
        super._();

  factory _$TicketMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketMessageImplFromJson(json);

  /// 消息 ID
  @override
  final int id;

  /// 消息内容
  @override
  final String content;

  /// 是否来自用户
  @override
  @JsonKey()
  final bool isFromUser;

  /// 是否已读
  @override
  @JsonKey()
  final bool isRead;

  /// 附件列表
  final List<String> _attachments;

  /// 附件列表
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 元数据
  final Map<String, dynamic> _metadata;

  /// 元数据
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'TicketMessage(id: $id, content: $content, isFromUser: $isFromUser, isRead: $isRead, attachments: $attachments, createdAt: $createdAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isFromUser, isFromUser) ||
                other.isFromUser == isFromUser) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      isFromUser,
      isRead,
      const DeepCollectionEquality().hash(_attachments),
      createdAt,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of TicketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketMessageImplCopyWith<_$TicketMessageImpl> get copyWith =>
      __$$TicketMessageImplCopyWithImpl<_$TicketMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketMessageImplToJson(
      this,
    );
  }
}

abstract class _TicketMessage extends TicketMessage {
  const factory _TicketMessage(
      {required final int id,
      required final String content,
      final bool isFromUser,
      final bool isRead,
      final List<String> attachments,
      required final DateTime createdAt,
      final Map<String, dynamic> metadata}) = _$TicketMessageImpl;
  const _TicketMessage._() : super._();

  factory _TicketMessage.fromJson(Map<String, dynamic> json) =
      _$TicketMessageImpl.fromJson;

  /// 消息 ID
  @override
  int get id;

  /// 消息内容
  @override
  String get content;

  /// 是否来自用户
  @override
  bool get isFromUser;

  /// 是否已读
  @override
  bool get isRead;

  /// 附件列表
  @override
  List<String> get attachments;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 元数据
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of TicketMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketMessageImplCopyWith<_$TicketMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
