.class Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;
.super Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;
.source "RmiDebuggedEnvironmentImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DebugConfigurableModel"
.end annotation


# static fields
.field static final KEYS:Ljava/util/List;


# instance fields
.field final configurable:Lfreemarker/core/Configurable;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 175
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "arithmetic_engine"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "boolean_format"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "classic_compatible"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "locale"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "number_format"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "object_wrapper"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "template_exception_handler"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->KEYS:Ljava/util/List;

    return-void
.end method

.method constructor <init>(Lfreemarker/core/Configurable;)V
    .registers 3
    .param p1, "configurable"    # Lfreemarker/core/Configurable;

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugMapModel;-><init>(Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$1;)V

    .line 190
    iput-object p1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->configurable:Lfreemarker/core/Configurable;

    .line 191
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 200
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->configurable:Lfreemarker/core/Configurable;

    invoke-virtual {v1, p1}, Lfreemarker/core/Configurable;->getSetting(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    new-instance v1, Lfreemarker/template/SimpleScalar;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_9
.end method

.method keySet()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 195
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->KEYS:Ljava/util/List;

    return-object v0
.end method
