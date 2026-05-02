.class public final enum Lorg/unbescape/javascript/JavaScriptEscapeType;
.super Ljava/lang/Enum;
.source "JavaScriptEscapeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/javascript/JavaScriptEscapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/javascript/JavaScriptEscapeType;

.field public static final enum SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

.field public static final enum SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

.field public static final enum UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

.field public static final enum XHEXA_DEFAULT_TO_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;


# instance fields
.field private final useSECs:Z

.field private final useXHexa:Z


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 62
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeType;

    const-string v1, "SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA"

    invoke-direct {v0, v1, v2, v3, v3}, Lorg/unbescape/javascript/JavaScriptEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    .line 67
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeType;

    const-string v1, "SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA"

    invoke-direct {v0, v1, v3, v3, v2}, Lorg/unbescape/javascript/JavaScriptEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    .line 73
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeType;

    const-string v1, "XHEXA_DEFAULT_TO_UHEXA"

    invoke-direct {v0, v1, v4, v2, v3}, Lorg/unbescape/javascript/JavaScriptEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->XHEXA_DEFAULT_TO_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    .line 78
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeType;

    const-string v1, "UHEXA"

    invoke-direct {v0, v1, v5, v2, v2}, Lorg/unbescape/javascript/JavaScriptEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    .line 56
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/unbescape/javascript/JavaScriptEscapeType;

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeType;->SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeType;->XHEXA_DEFAULT_TO_UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeType;->UHEXA:Lorg/unbescape/javascript/JavaScriptEscapeType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->$VALUES:[Lorg/unbescape/javascript/JavaScriptEscapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .registers 5
    .param p3, "useSECs"    # Z
    .param p4, "useXHexa"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 85
    iput-boolean p3, p0, Lorg/unbescape/javascript/JavaScriptEscapeType;->useSECs:Z

    .line 86
    iput-boolean p4, p0, Lorg/unbescape/javascript/JavaScriptEscapeType;->useXHexa:Z

    .line 87
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/javascript/JavaScriptEscapeType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 56
    const-class v0, Lorg/unbescape/javascript/JavaScriptEscapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/javascript/JavaScriptEscapeType;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/javascript/JavaScriptEscapeType;
    .registers 1

    .prologue
    .line 56
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeType;->$VALUES:[Lorg/unbescape/javascript/JavaScriptEscapeType;

    invoke-virtual {v0}, [Lorg/unbescape/javascript/JavaScriptEscapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/javascript/JavaScriptEscapeType;

    return-object v0
.end method


# virtual methods
.method getUseSECs()Z
    .registers 2

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/unbescape/javascript/JavaScriptEscapeType;->useSECs:Z

    return v0
.end method

.method getUseXHexa()Z
    .registers 2

    .prologue
    .line 94
    iget-boolean v0, p0, Lorg/unbescape/javascript/JavaScriptEscapeType;->useXHexa:Z

    return v0
.end method
