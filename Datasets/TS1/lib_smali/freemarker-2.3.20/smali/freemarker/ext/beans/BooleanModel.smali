.class public Lfreemarker/ext/beans/BooleanModel;
.super Lfreemarker/ext/beans/BeanModel;
.source "BooleanModel.java"

# interfaces
.implements Lfreemarker/template/TemplateBooleanModel;


# instance fields
.field private final value:Z


# direct methods
.method public constructor <init>(Ljava/lang/Boolean;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "bool"    # Ljava/lang/Boolean;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/BeanModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 69
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/ext/beans/BooleanModel;->value:Z

    .line 70
    return-void
.end method


# virtual methods
.method public getAsBoolean()Z
    .registers 2

    .prologue
    .line 74
    iget-boolean v0, p0, Lfreemarker/ext/beans/BooleanModel;->value:Z

    return v0
.end method
