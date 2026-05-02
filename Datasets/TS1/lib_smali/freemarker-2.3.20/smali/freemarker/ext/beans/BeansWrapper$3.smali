.class final Lfreemarker/ext/beans/BeansWrapper$3;
.super Ljava/lang/Object;
.source "BeansWrapper.java"

# interfaces
.implements Lfreemarker/ext/util/ModelFactory;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 541
    new-instance v0, Lfreemarker/ext/beans/EnumerationModel;

    check-cast p1, Ljava/util/Enumeration;

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p2, Lfreemarker/ext/beans/BeansWrapper;

    .end local p2    # "wrapper":Lfreemarker/template/ObjectWrapper;
    invoke-direct {v0, p1, p2}, Lfreemarker/ext/beans/EnumerationModel;-><init>(Ljava/util/Enumeration;Lfreemarker/ext/beans/BeansWrapper;)V

    return-object v0
.end method
