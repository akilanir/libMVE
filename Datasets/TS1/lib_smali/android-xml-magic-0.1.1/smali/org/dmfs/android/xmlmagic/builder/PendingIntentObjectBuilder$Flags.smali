.class abstract enum Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x440a
    name = "Flags"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

.field public static final enum flag_cancel_current:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

.field public static final enum flag_no_create:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

.field public static final enum flag_one_shot:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

.field public static final enum flag_update_current:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$1;

    const-string v1, "flag_no_create"

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_no_create:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$2;

    const-string v1, "flag_one_shot"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_one_shot:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$3;

    const-string v1, "flag_cancel_current"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_cancel_current:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$4;

    const-string v1, "flag_update_current"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_update_current:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    const/4 v0, 0x4

    new-array v0, v0, [Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_no_create:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    aput-object v1, v0, v2

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_one_shot:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_cancel_current:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->flag_update_current:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    aput-object v1, v0, v5

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->$VALUES:[Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

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

.method synthetic constructor <init>(Ljava/lang/String;ILorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$1;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static get(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;
    .registers 3

    const/16 v0, 0x2d

    const/16 v1, 0x5f

    :try_start_4
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->valueOf(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;
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

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;
    .registers 2

    const-class v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->$VALUES:[Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    invoke-virtual {v0}, [Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    return-object v0
.end method


# virtual methods
.method public abstract get()I
.end method
