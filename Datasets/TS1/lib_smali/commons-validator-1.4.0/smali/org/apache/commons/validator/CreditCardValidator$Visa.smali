.class Lorg/apache/commons/validator/CreditCardValidator$Visa;
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
    name = "Visa"
.end annotation


# static fields
.field private static final PREFIX:Ljava/lang/String; = "4"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/apache/commons/validator/CreditCardValidator$1;

    .prologue
    .line 212
    invoke-direct {p0}, Lorg/apache/commons/validator/CreditCardValidator$Visa;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Ljava/lang/String;)Z
    .registers 6
    .param p1, "card"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 215
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v3, "4"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xd

    if-eq v2, v3, :cond_1e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x10

    if-ne v2, v3, :cond_1f

    :cond_1e
    :goto_1e
    return v0

    :cond_1f
    move v0, v1

    goto :goto_1e
.end method
