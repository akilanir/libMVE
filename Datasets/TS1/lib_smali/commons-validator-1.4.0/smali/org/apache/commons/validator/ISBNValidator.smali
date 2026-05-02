.class public Lorg/apache/commons/validator/ISBNValidator;
.super Ljava/lang/Object;
.source "ISBNValidator.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 3
    .param p1, "isbn"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-static {}, Lorg/apache/commons/validator/routines/ISBNValidator;->getInstance()Lorg/apache/commons/validator/routines/ISBNValidator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/validator/routines/ISBNValidator;->isValidISBN10(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
