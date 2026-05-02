.class Lfreemarker/core/ExistenceBuiltins$defaultBI;
.super Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;
.source "ExistenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ExistenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "defaultBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/ExistenceBuiltins$defaultBI$ConstantMethod;
    }
.end annotation


# static fields
.field private static final FIRST_NON_NULL_METHOD:Lfreemarker/template/TemplateMethodModelEx;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 64
    new-instance v0, Lfreemarker/core/ExistenceBuiltins$defaultBI$1;

    invoke-direct {v0}, Lfreemarker/core/ExistenceBuiltins$defaultBI$1;-><init>()V

    sput-object v0, Lfreemarker/core/ExistenceBuiltins$defaultBI;->FIRST_NON_NULL_METHOD:Lfreemarker/template/TemplateMethodModelEx;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;-><init>(Lfreemarker/core/ExistenceBuiltins$1;)V

    .line 47
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lfreemarker/core/ExistenceBuiltins$defaultBI;->evalMaybeNonexistentTarget(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 44
    .local v0, "model":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_9

    sget-object v1, Lfreemarker/core/ExistenceBuiltins$defaultBI;->FIRST_NON_NULL_METHOD:Lfreemarker/template/TemplateMethodModelEx;

    :goto_8
    return-object v1

    :cond_9
    new-instance v1, Lfreemarker/core/ExistenceBuiltins$defaultBI$ConstantMethod;

    invoke-direct {v1, v0}, Lfreemarker/core/ExistenceBuiltins$defaultBI$ConstantMethod;-><init>(Lfreemarker/template/TemplateModel;)V

    goto :goto_8
.end method
