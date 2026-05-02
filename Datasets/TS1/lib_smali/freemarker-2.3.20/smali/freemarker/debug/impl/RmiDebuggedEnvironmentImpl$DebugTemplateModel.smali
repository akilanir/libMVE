.class Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;
.super Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;
.source "RmiDebuggedEnvironmentImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DebugTemplateModel"
.end annotation


# static fields
.field private static final KEYS:Ljava/util/List;


# instance fields
.field private final name:Lfreemarker/template/SimpleScalar;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 248
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->KEYS:Ljava/util/List;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "configuration"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "name"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;->composeList(Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;->KEYS:Ljava/util/List;

    return-void
.end method

.method constructor <init>(Lfreemarker/template/Template;)V
    .registers 4
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 258
    invoke-direct {p0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;-><init>(Lfreemarker/core/Configurable;)V

    .line 259
    new-instance v0, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;->name:Lfreemarker/template/SimpleScalar;

    .line 260
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
    .line 269
    const-string v1, "configuration"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 273
    :try_start_8
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v1, Lfreemarker/template/Template;

    invoke-virtual {v1}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->getCachedWrapperFor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/template/TemplateModel;
    :try_end_16
    .catch Ljava/rmi/RemoteException; {:try_start_8 .. :try_end_16} :catch_17

    .line 284
    :goto_16
    return-object v1

    .line 275
    :catch_17
    move-exception v0

    .line 277
    .local v0, "e":Ljava/rmi/RemoteException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1

    .line 280
    .end local v0    # "e":Ljava/rmi/RemoteException;
    :cond_1e
    const-string v1, "name"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 282
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;->name:Lfreemarker/template/SimpleScalar;

    goto :goto_16

    .line 284
    :cond_29
    invoke-super {p0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_16
.end method

.method keySet()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 264
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugTemplateModel;->KEYS:Ljava/util/List;

    return-object v0
.end method
