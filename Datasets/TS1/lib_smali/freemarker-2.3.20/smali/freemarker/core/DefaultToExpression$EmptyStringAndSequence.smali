.class Lfreemarker/core/DefaultToExpression$EmptyStringAndSequence;
.super Ljava/lang/Object;
.source "DefaultToExpression.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateHashModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/DefaultToExpression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EmptyStringAndSequence"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/DefaultToExpression$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/DefaultToExpression$1;

    .prologue
    .line 69
    invoke-direct {p0}, Lfreemarker/core/DefaultToExpression$EmptyStringAndSequence;-><init>()V

    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 75
    const/4 v0, 0x0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 78
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 72
    const-string v0, ""

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 84
    const/4 v0, 0x1

    return v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 2

    .prologue
    .line 87
    invoke-static {}, Lfreemarker/core/DefaultToExpression;->access$000()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 2

    .prologue
    .line 90
    invoke-static {}, Lfreemarker/core/DefaultToExpression;->access$000()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    return-object v0
.end method
