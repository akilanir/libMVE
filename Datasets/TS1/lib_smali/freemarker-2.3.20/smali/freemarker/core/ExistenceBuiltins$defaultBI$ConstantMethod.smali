.class Lfreemarker/core/ExistenceBuiltins$defaultBI$ConstantMethod;
.super Ljava/lang/Object;
.source "ExistenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ExistenceBuiltins$defaultBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConstantMethod"
.end annotation


# instance fields
.field private final constant:Lfreemarker/template/TemplateModel;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateModel;)V
    .registers 2
    .param p1, "constant"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lfreemarker/core/ExistenceBuiltins$defaultBI$ConstantMethod;->constant:Lfreemarker/template/TemplateModel;

    .line 53
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "args"    # Ljava/util/List;

    .prologue
    .line 56
    iget-object v0, p0, Lfreemarker/core/ExistenceBuiltins$defaultBI$ConstantMethod;->constant:Lfreemarker/template/TemplateModel;

    return-object v0
.end method
