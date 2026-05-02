.class public Lch/qos/logback/core/helpers/Transform;
.super Ljava/lang/Object;


# static fields
.field private static final CDATA_EMBEDED_END:Ljava/lang/String; = "]]>]]&gt;<![CDATA["

.field private static final CDATA_END:Ljava/lang/String; = "]]>"

.field private static final CDATA_END_LEN:I

.field private static final CDATA_PSEUDO_END:Ljava/lang/String; = "]]&gt;"

.field private static final CDATA_START:Ljava/lang/String; = "<![CDATA["


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "]]>"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lch/qos/logback/core/helpers/Transform;->CDATA_END_LEN:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendEscapingCDATA(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .registers 5

    if-nez p1, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    const-string v0, "]]>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_f

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_f
    const/4 v0, 0x0

    :goto_10
    const/4 v2, -0x1

    if-le v1, v2, :cond_2f

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "]]>]]&gt;<![CDATA["

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Lch/qos/logback/core/helpers/Transform;->CDATA_END_LEN:I

    add-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    const-string v1, "]]>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_10

    :cond_2f
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2
.end method

.method public static escapeTags(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const/4 v1, -0x1

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_19

    const-string v0, "<"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_1a

    const-string v0, ">"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v1, :cond_1a

    :cond_19
    :goto_19
    return-object p0

    :cond_1a
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lch/qos/logback/core/helpers/Transform;->escapeTags(Ljava/lang/StringBuffer;)Ljava/lang/String;

    move-result-object p0

    goto :goto_19
.end method

.method public static escapeTags(Ljava/lang/StringBuffer;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-ge v0, v1, :cond_25

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v1

    const/16 v2, 0x3c

    if-ne v1, v2, :cond_19

    add-int/lit8 v1, v0, 0x1

    const-string v2, "&lt;"

    invoke-virtual {p0, v0, v1, v2}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    :cond_16
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_19
    const/16 v2, 0x3e

    if-ne v1, v2, :cond_16

    add-int/lit8 v1, v0, 0x1

    const-string v2, "&gt;"

    invoke-virtual {p0, v0, v1, v2}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_16

    :cond_25
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
