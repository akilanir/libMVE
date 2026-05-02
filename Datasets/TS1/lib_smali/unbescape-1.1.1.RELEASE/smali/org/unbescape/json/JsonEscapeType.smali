.class public final enum Lorg/unbescape/json/JsonEscapeType;
.super Ljava/lang/Enum;
.source "JsonEscapeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/json/JsonEscapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/json/JsonEscapeType;

.field public static final enum SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

.field public static final enum UHEXA:Lorg/unbescape/json/JsonEscapeType;


# instance fields
.field private final useSECs:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 51
    new-instance v0, Lorg/unbescape/json/JsonEscapeType;

    const-string v1, "SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA"

    invoke-direct {v0, v1, v2, v3}, Lorg/unbescape/json/JsonEscapeType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lorg/unbescape/json/JsonEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

    .line 56
    new-instance v0, Lorg/unbescape/json/JsonEscapeType;

    const-string v1, "UHEXA"

    invoke-direct {v0, v1, v3, v2}, Lorg/unbescape/json/JsonEscapeType;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lorg/unbescape/json/JsonEscapeType;->UHEXA:Lorg/unbescape/json/JsonEscapeType;

    .line 46
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/unbescape/json/JsonEscapeType;

    sget-object v1, Lorg/unbescape/json/JsonEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/json/JsonEscapeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/json/JsonEscapeType;->UHEXA:Lorg/unbescape/json/JsonEscapeType;

    aput-object v1, v0, v3

    sput-object v0, Lorg/unbescape/json/JsonEscapeType;->$VALUES:[Lorg/unbescape/json/JsonEscapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .registers 4
    .param p3, "useSECs"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 62
    iput-boolean p3, p0, Lorg/unbescape/json/JsonEscapeType;->useSECs:Z

    .line 63
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/json/JsonEscapeType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v0, Lorg/unbescape/json/JsonEscapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/json/JsonEscapeType;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/json/JsonEscapeType;
    .registers 1

    .prologue
    .line 46
    sget-object v0, Lorg/unbescape/json/JsonEscapeType;->$VALUES:[Lorg/unbescape/json/JsonEscapeType;

    invoke-virtual {v0}, [Lorg/unbescape/json/JsonEscapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/json/JsonEscapeType;

    return-object v0
.end method


# virtual methods
.method getUseSECs()Z
    .registers 2

    .prologue
    .line 66
    iget-boolean v0, p0, Lorg/unbescape/json/JsonEscapeType;->useSECs:Z

    return v0
.end method
