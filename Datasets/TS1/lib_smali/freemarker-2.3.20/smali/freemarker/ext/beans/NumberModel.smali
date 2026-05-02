.class public Lfreemarker/ext/beans/NumberModel;
.super Lfreemarker/ext/beans/BeanModel;
.source "NumberModel.java"

# interfaces
.implements Lfreemarker/template/TemplateNumberModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    new-instance v0, Lfreemarker/ext/beans/NumberModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/NumberModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/NumberModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "number"    # Ljava/lang/Number;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/BeanModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 90
    return-void
.end method


# virtual methods
.method public getAsNumber()Ljava/lang/Number;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lfreemarker/ext/beans/NumberModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    return-object v0
.end method
