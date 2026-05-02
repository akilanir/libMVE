.class final Lfreemarker/ext/beans/CollectionModel$1;
.super Ljava/lang/Object;
.source "CollectionModel.java"

# interfaces
.implements Lfreemarker/ext/util/ModelFactory;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 84
    new-instance v0, Lfreemarker/ext/beans/CollectionModel;

    check-cast p1, Ljava/util/Collection;

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p2, Lfreemarker/ext/beans/BeansWrapper;

    .end local p2    # "wrapper":Lfreemarker/template/ObjectWrapper;
    invoke-direct {v0, p1, p2}, Lfreemarker/ext/beans/CollectionModel;-><init>(Ljava/util/Collection;Lfreemarker/ext/beans/BeansWrapper;)V

    return-object v0
.end method
