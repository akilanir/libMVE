.class abstract enum Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x440a
    name = "Flags"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_brought_to_front:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_clear_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_clear_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_clear_when_task_reset:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_exclude_from_recents:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_forward_result:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_launched_from_history:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_multiple_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_new_document:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_new_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_no_animation:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_no_history:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_no_user_action:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_previous_is_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_reorder_to_front:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_reset_task_if_needed:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_single_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum activity_task_on_home:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum debug_log_resolution:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum from_background:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum grant_persistable_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum grant_prefix_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum grant_read_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum grant_write_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

.field public static final enum receiver_registered_only:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$1;

    const-string v1, "activity_brought_to_front"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_brought_to_front:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$2;

    const-string v1, "activity_clear_task"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_clear_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$3;

    const-string v1, "activity_clear_top"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_clear_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$4;

    const-string v1, "activity_clear_when_task_reset"

    invoke-direct {v0, v1, v6}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_clear_when_task_reset:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$5;

    const-string v1, "grant_read_uri_permission"

    invoke-direct {v0, v1, v7}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_read_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$6;

    const-string v1, "grant_write_uri_permission"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_write_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$7;

    const-string v1, "grant_persistable_uri_permission"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_persistable_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$8;

    const-string v1, "grant_prefix_uri_permission"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_prefix_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$9;

    const-string v1, "debug_log_resolution"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$9;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->debug_log_resolution:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$10;

    const-string v1, "from_background"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$10;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->from_background:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$11;

    const-string v1, "activity_exclude_from_recents"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$11;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_exclude_from_recents:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$12;

    const-string v1, "activity_forward_result"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$12;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_forward_result:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$13;

    const-string v1, "activity_launched_from_history"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$13;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_launched_from_history:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$14;

    const-string v1, "activity_multiple_task"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$14;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_multiple_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$15;

    const-string v1, "activity_new_document"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$15;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_new_document:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$16;

    const-string v1, "activity_new_task"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$16;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_new_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$17;

    const-string v1, "activity_no_animation"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$17;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_no_animation:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$18;

    const-string v1, "activity_no_history"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$18;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_no_history:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$19;

    const-string v1, "activity_no_user_action"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$19;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_no_user_action:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$20;

    const-string v1, "activity_previous_is_top"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$20;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_previous_is_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$21;

    const-string v1, "activity_reset_task_if_needed"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$21;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_reset_task_if_needed:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$22;

    const-string v1, "activity_reorder_to_front"

    const/16 v2, 0x15

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$22;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_reorder_to_front:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$23;

    const-string v1, "activity_single_top"

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$23;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_single_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$24;

    const-string v1, "activity_task_on_home"

    const/16 v2, 0x17

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$24;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_task_on_home:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$25;

    const-string v1, "receiver_registered_only"

    const/16 v2, 0x18

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags$25;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->receiver_registered_only:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    const/16 v0, 0x19

    new-array v0, v0, [Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_brought_to_front:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_clear_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_clear_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v1, v0, v5

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_clear_when_task_reset:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v1, v0, v6

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_read_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_write_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_persistable_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->grant_prefix_uri_permission:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->debug_log_resolution:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->from_background:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_exclude_from_recents:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_forward_result:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_launched_from_history:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_multiple_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_new_document:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_new_task:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_no_animation:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_no_history:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_no_user_action:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_previous_is_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_reset_task_if_needed:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_reorder_to_front:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_single_top:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->activity_task_on_home:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->receiver_registered_only:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->$VALUES:[Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$1;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static get(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;
    .registers 3

    const/16 v0, 0x2d

    const/16 v1, 0x5f

    :try_start_4
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->valueOf(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;
    :try_end_b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_b} :catch_d

    move-result-object v0

    :goto_c
    return-object v0

    :catch_d
    move-exception v0

    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;
    .registers 2

    const-class v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->$VALUES:[Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    invoke-virtual {v0}, [Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    return-object v0
.end method


# virtual methods
.method public abstract get()I
.end method
