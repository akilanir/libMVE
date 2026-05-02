.class Lorg/apache/commons/validator/CreditCardValidator$Mastercard;
.super Ljava/lang/Object;
.source "CreditCardValidator.java"

# interfaces
.implements Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/validator/CreditCardValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Mastercard"
.end annotation


# static fields
.field private static final PREFIX:Ljava/lang/String; = "51,52,53,54,55,"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/apache/commons/validator/CreditCardValidator$1;

    .prologue
    .line 236
    invoke-direct {p0}, Lorg/apache/commons/validator/CreditCardValidator$Mastercard;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Ljava/lang/String;)Z
    .registers 6
    .param p1, "card"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 239
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v3, 0x2

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, "prefix2":Ljava/lang/String;
    const-string v2, "51,52,53,54,55,"

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x10

    if-ne v2, v3, :cond_2b

    const/4 v1, 0x1

    :cond_2b
    return v1
.end method
