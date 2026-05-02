.class public final enum Lorg/unbescape/html/HtmlEscapeType;
.super Ljava/lang/Enum;
.source "HtmlEscapeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/html/HtmlEscapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/html/HtmlEscapeType;

.field public static final enum DECIMAL_REFERENCES:Lorg/unbescape/html/HtmlEscapeType;

.field public static final enum HEXADECIMAL_REFERENCES:Lorg/unbescape/html/HtmlEscapeType;

.field public static final enum HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

.field public static final enum HTML4_NAMED_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/html/HtmlEscapeType;

.field public static final enum HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

.field public static final enum HTML5_NAMED_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/html/HtmlEscapeType;


# instance fields
.field private final useHexa:Z

.field private final useHtml5:Z

.field private final useNCRs:Z


# direct methods
.method static constructor <clinit>()V
    .registers 13

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    new-instance v0, Lorg/unbescape/html/HtmlEscapeType;

    const-string v1, "HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL"

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lorg/unbescape/html/HtmlEscapeType;-><init>(Ljava/lang/String;IZZZ)V

    sput-object v0, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    .line 74
    new-instance v4, Lorg/unbescape/html/HtmlEscapeType;

    const-string v5, "HTML4_NAMED_REFERENCES_DEFAULT_TO_HEXA"

    move v6, v3

    move v7, v3

    move v8, v3

    move v9, v2

    invoke-direct/range {v4 .. v9}, Lorg/unbescape/html/HtmlEscapeType;-><init>(Ljava/lang/String;IZZZ)V

    sput-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/html/HtmlEscapeType;

    .line 79
    new-instance v4, Lorg/unbescape/html/HtmlEscapeType;

    const-string v5, "HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL"

    move v6, v10

    move v7, v3

    move v8, v2

    move v9, v3

    invoke-direct/range {v4 .. v9}, Lorg/unbescape/html/HtmlEscapeType;-><init>(Ljava/lang/String;IZZZ)V

    sput-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    .line 84
    new-instance v4, Lorg/unbescape/html/HtmlEscapeType;

    const-string v5, "HTML5_NAMED_REFERENCES_DEFAULT_TO_HEXA"

    move v6, v11

    move v7, v3

    move v8, v3

    move v9, v3

    invoke-direct/range {v4 .. v9}, Lorg/unbescape/html/HtmlEscapeType;-><init>(Ljava/lang/String;IZZZ)V

    sput-object v4, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/html/HtmlEscapeType;

    .line 89
    new-instance v4, Lorg/unbescape/html/HtmlEscapeType;

    const-string v5, "DECIMAL_REFERENCES"

    move v6, v12

    move v7, v2

    move v8, v2

    move v9, v2

    invoke-direct/range {v4 .. v9}, Lorg/unbescape/html/HtmlEscapeType;-><init>(Ljava/lang/String;IZZZ)V

    sput-object v4, Lorg/unbescape/html/HtmlEscapeType;->DECIMAL_REFERENCES:Lorg/unbescape/html/HtmlEscapeType;

    .line 94
    new-instance v4, Lorg/unbescape/html/HtmlEscapeType;

    const-string v5, "HEXADECIMAL_REFERENCES"

    const/4 v6, 0x5

    move v7, v2

    move v8, v3

    move v9, v2

    invoke-direct/range {v4 .. v9}, Lorg/unbescape/html/HtmlEscapeType;-><init>(Ljava/lang/String;IZZZ)V

    sput-object v4, Lorg/unbescape/html/HtmlEscapeType;->HEXADECIMAL_REFERENCES:Lorg/unbescape/html/HtmlEscapeType;

    .line 64
    const/4 v0, 0x6

    new-array v0, v0, [Lorg/unbescape/html/HtmlEscapeType;

    sget-object v1, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/html/HtmlEscapeType;->HTML4_NAMED_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/html/HtmlEscapeType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/html/HtmlEscapeType;

    aput-object v1, v0, v10

    sget-object v1, Lorg/unbescape/html/HtmlEscapeType;->HTML5_NAMED_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/html/HtmlEscapeType;

    aput-object v1, v0, v11

    sget-object v1, Lorg/unbescape/html/HtmlEscapeType;->DECIMAL_REFERENCES:Lorg/unbescape/html/HtmlEscapeType;

    aput-object v1, v0, v12

    const/4 v1, 0x5

    sget-object v2, Lorg/unbescape/html/HtmlEscapeType;->HEXADECIMAL_REFERENCES:Lorg/unbescape/html/HtmlEscapeType;

    aput-object v2, v0, v1

    sput-object v0, Lorg/unbescape/html/HtmlEscapeType;->$VALUES:[Lorg/unbescape/html/HtmlEscapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZZ)V
    .registers 6
    .param p3, "useNCRs"    # Z
    .param p4, "useHexa"    # Z
    .param p5, "useHtml5"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ)V"
        }
    .end annotation

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 102
    iput-boolean p3, p0, Lorg/unbescape/html/HtmlEscapeType;->useNCRs:Z

    .line 103
    iput-boolean p4, p0, Lorg/unbescape/html/HtmlEscapeType;->useHexa:Z

    .line 104
    iput-boolean p5, p0, Lorg/unbescape/html/HtmlEscapeType;->useHtml5:Z

    .line 105
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/html/HtmlEscapeType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 64
    const-class v0, Lorg/unbescape/html/HtmlEscapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/html/HtmlEscapeType;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/html/HtmlEscapeType;
    .registers 1

    .prologue
    .line 64
    sget-object v0, Lorg/unbescape/html/HtmlEscapeType;->$VALUES:[Lorg/unbescape/html/HtmlEscapeType;

    invoke-virtual {v0}, [Lorg/unbescape/html/HtmlEscapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/html/HtmlEscapeType;

    return-object v0
.end method


# virtual methods
.method getUseHexa()Z
    .registers 2

    .prologue
    .line 112
    iget-boolean v0, p0, Lorg/unbescape/html/HtmlEscapeType;->useHexa:Z

    return v0
.end method

.method getUseHtml5()Z
    .registers 2

    .prologue
    .line 116
    iget-boolean v0, p0, Lorg/unbescape/html/HtmlEscapeType;->useHtml5:Z

    return v0
.end method

.method getUseNCRs()Z
    .registers 2

    .prologue
    .line 108
    iget-boolean v0, p0, Lorg/unbescape/html/HtmlEscapeType;->useNCRs:Z

    return v0
.end method
