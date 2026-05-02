.class public final enum Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskContract$Property$Relation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RelType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum CHILD:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum DEPENDS_ON:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum FINISHTOFINISH:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum FINISHTOSTART:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum PARENT:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum REFID:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum SIBLING:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum STARTTOFINISH:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum STARTTOSTART:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

.field public static final enum STRUCTURED_CATEGORY:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "PARENT"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->PARENT:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "CHILD"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->CHILD:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "SIBLING"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->SIBLING:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "DEPENDS_ON"

    invoke-direct {v0, v1, v6}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->DEPENDS_ON:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "REFID"

    invoke-direct {v0, v1, v7}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->REFID:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "STRUCTURED_CATEGORY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->STRUCTURED_CATEGORY:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "FINISHTOSTART"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->FINISHTOSTART:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "FINISHTOFINISH"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->FINISHTOFINISH:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "STARTTOFINISH"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->STARTTOFINISH:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    new-instance v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const-string v1, "STARTTOSTART"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->STARTTOSTART:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    const/16 v0, 0xa

    new-array v0, v0, [Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->PARENT:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->CHILD:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->SIBLING:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->DEPENDS_ON:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->REFID:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->STRUCTURED_CATEGORY:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->FINISHTOSTART:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->FINISHTOFINISH:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->STARTTOFINISH:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->STARTTOSTART:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->$VALUES:[Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

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

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;
    .registers 2

    const-class v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;
    .registers 1

    sget-object v0, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->$VALUES:[Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v0}, [Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    return-object v0
.end method
