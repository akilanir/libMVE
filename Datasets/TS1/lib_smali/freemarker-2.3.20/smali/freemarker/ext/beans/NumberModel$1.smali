.class final Lfreemarker/ext/beans/NumberModel$1;
.super Ljava/lang/Object;
.source "NumberModel.java"

# interfaces
.implements Lfreemarker/ext/util/ModelFactory;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 76
    new-instance v0, Lfreemarker/ext/beans/NumberModel;

    check-cast p1, Ljava/lang/Number;

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p2, Lfreemarker/ext/beans/BeansWrapper;

    .end local p2    # "wrapper":Lfreemarker/template/ObjectWrapper;
    invoke-direct {v0, p1, p2}, Lfreemarker/ext/beans/NumberModel;-><init>(Ljava/lang/Number;Lfreemarker/ext/beans/BeansWrapper;)V

    return-object v0
.end method
