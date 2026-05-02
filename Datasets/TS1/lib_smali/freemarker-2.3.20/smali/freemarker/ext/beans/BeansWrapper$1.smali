.class Lfreemarker/ext/beans/BeansWrapper$1;
.super Ljava/lang/Object;
.source "BeansWrapper.java"

# interfaces
.implements Lfreemarker/ext/util/ModelFactory;


# instance fields
.field private final this$0:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 2

    .prologue
    .line 527
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/beans/BeansWrapper$1;->this$0:Lfreemarker/ext/beans/BeansWrapper;

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 529
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$1;->this$0:Lfreemarker/ext/beans/BeansWrapper;

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->access$000(Lfreemarker/ext/beans/BeansWrapper;)Lfreemarker/ext/beans/BooleanModel;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$1;->this$0:Lfreemarker/ext/beans/BeansWrapper;

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->access$100(Lfreemarker/ext/beans/BeansWrapper;)Lfreemarker/ext/beans/BooleanModel;

    move-result-object v0

    goto :goto_e
.end method
