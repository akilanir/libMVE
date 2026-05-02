.class public abstract enum Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "BooleanOperation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

.field public static final enum and:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

.field public static final enum or:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

.field public static final enum xor:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$1;

    const-string v1, "or"

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->or:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$2;

    const-string v1, "and"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->and:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$3;

    const-string v1, "xor"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->xor:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    const/4 v0, 0x3

    new-array v0, v0, [Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->or:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    aput-object v1, v0, v2

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->and:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->xor:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    aput-object v1, v0, v4

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->$VALUES:[Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

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

.method synthetic constructor <init>(Ljava/lang/String;ILorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$1;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;
    .registers 2

    const-class v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->$VALUES:[Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    invoke-virtual {v0}, [Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    return-object v0
.end method


# virtual methods
.method public abstract calculate(ZZ)Z
.end method
