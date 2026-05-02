.class public Lfreemarker/template/utility/XmlEscape;
.super Ljava/lang/Object;
.source "XmlEscape.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# static fields
.field private static final AMP:[C

.field private static final APOS:[C

.field private static final GT:[C

.field private static final LT:[C

.field private static final QUOT:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 70
    const-string v0, "&lt;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/XmlEscape;->LT:[C

    .line 71
    const-string v0, "&gt;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/XmlEscape;->GT:[C

    .line 72
    const-string v0, "&amp;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/XmlEscape;->AMP:[C

    .line 73
    const-string v0, "&quot;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/XmlEscape;->QUOT:[C

    .line 74
    const-string v0, "&apos;"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/XmlEscape;->APOS:[C

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$000()[C
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lfreemarker/template/utility/XmlEscape;->LT:[C

    return-object v0
.end method

.method static access$100()[C
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lfreemarker/template/utility/XmlEscape;->GT:[C

    return-object v0
.end method

.method static access$200()[C
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lfreemarker/template/utility/XmlEscape;->AMP:[C

    return-object v0
.end method

.method static access$300()[C
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lfreemarker/template/utility/XmlEscape;->QUOT:[C

    return-object v0
.end method

.method static access$400()[C
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lfreemarker/template/utility/XmlEscape;->APOS:[C

    return-object v0
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 4
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;

    .prologue
    .line 78
    new-instance v0, Lfreemarker/template/utility/XmlEscape$1;

    invoke-direct {v0, p0, p1}, Lfreemarker/template/utility/XmlEscape$1;-><init>(Lfreemarker/template/utility/XmlEscape;Ljava/io/Writer;)V

    return-object v0
.end method
