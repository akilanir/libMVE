.class Lorg/apache/commons/validator/CreditCardValidator$Discover;
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
    name = "Discover"
.end annotation


# static fields
.field private static final PREFIX:Ljava/lang/String; = "6011"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/apache/commons/validator/CreditCardValidator$1;

    .prologue
    .line 229
    invoke-direct {p0}, Lorg/apache/commons/validator/CreditCardValidator$Discover;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Ljava/lang/String;)Z
    .registers 5
    .param p1, "card"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 232
    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v2, "6011"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_17

    const/4 v0, 0x1

    :cond_17
    return v0
.end method
