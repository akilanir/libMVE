.class public Lfreemarker/ext/beans/DateModel;
.super Lfreemarker/ext/beans/BeanModel;
.source "DateModel.java"

# interfaces
.implements Lfreemarker/template/TemplateDateModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# instance fields
.field private final type:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 73
    new-instance v0, Lfreemarker/ext/beans/DateModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/DateModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/DateModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/BeanModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 95
    instance-of v0, p1, Ljava/sql/Date;

    if-eqz v0, :cond_b

    .line 96
    const/4 v0, 0x2

    iput v0, p0, Lfreemarker/ext/beans/DateModel;->type:I

    .line 107
    :goto_a
    return-void

    .line 98
    :cond_b
    instance-of v0, p1, Ljava/sql/Time;

    if-eqz v0, :cond_13

    .line 99
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/ext/beans/DateModel;->type:I

    goto :goto_a

    .line 101
    :cond_13
    instance-of v0, p1, Ljava/sql/Timestamp;

    if-eqz v0, :cond_1b

    .line 102
    const/4 v0, 0x3

    iput v0, p0, Lfreemarker/ext/beans/DateModel;->type:I

    goto :goto_a

    .line 105
    :cond_1b
    invoke-virtual {p2}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultDateType()I

    move-result v0

    iput v0, p0, Lfreemarker/ext/beans/DateModel;->type:I

    goto :goto_a
.end method


# virtual methods
.method public getAsDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lfreemarker/ext/beans/DateModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public getDateType()I
    .registers 2

    .prologue
    .line 114
    iget v0, p0, Lfreemarker/ext/beans/DateModel;->type:I

    return v0
.end method
