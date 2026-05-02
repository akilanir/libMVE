.class Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;
.super Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;
.source "RmiDebuggedEnvironmentImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DebugEnvironmentModel"
.end annotation


# static fields
.field private static final KEYS:Ljava/util/List;


# instance fields
.field private knownVariables:Lfreemarker/template/TemplateModel;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 290
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->KEYS:Ljava/util/List;

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "currentNamespace"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "dataModel"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "globalNamespace"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "knownVariables"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "mainNamespace"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "template"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->composeList(Ljava/util/Collection;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->KEYS:Ljava/util/List;

    return-void
.end method

.method constructor <init>(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 322
    invoke-direct {p0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;-><init>(Lfreemarker/core/Configurable;)V

    .line 300
    new-instance v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel$1;

    invoke-direct {v0, p0}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel$1;-><init>(Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;)V

    iput-object v0, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->knownVariables:Lfreemarker/template/TemplateModel;

    .line 323
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
    .line 332
    const-string v1, "currentNamespace"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 334
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v1, Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getCurrentNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    .line 363
    :goto_10
    return-object v1

    .line 336
    :cond_11
    const-string v1, "dataModel"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 338
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v1, Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getDataModel()Lfreemarker/template/TemplateHashModel;

    move-result-object v1

    goto :goto_10

    .line 340
    :cond_22
    const-string v1, "globalNamespace"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    .line 342
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v1, Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getGlobalNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    goto :goto_10

    .line 344
    :cond_33
    const-string v1, "knownVariables"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 346
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->knownVariables:Lfreemarker/template/TemplateModel;

    goto :goto_10

    .line 348
    :cond_3e
    const-string v1, "mainNamespace"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 350
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v1, Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getMainNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    goto :goto_10

    .line 352
    :cond_4f
    const-string v1, "template"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6d

    .line 356
    :try_start_57
    iget-object v1, p0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->configurable:Lfreemarker/core/Configurable;

    check-cast v1, Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl;->getCachedWrapperFor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/template/TemplateModel;
    :try_end_65
    .catch Ljava/rmi/RemoteException; {:try_start_57 .. :try_end_65} :catch_66

    goto :goto_10

    .line 358
    :catch_66
    move-exception v0

    .line 360
    .local v0, "e":Ljava/rmi/RemoteException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1

    .line 363
    .end local v0    # "e":Ljava/rmi/RemoteException;
    :cond_6d
    invoke-super {p0, p1}, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugConfigurableModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_10
.end method

.method keySet()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 327
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggedEnvironmentImpl$DebugEnvironmentModel;->KEYS:Ljava/util/List;

    return-object v0
.end method
