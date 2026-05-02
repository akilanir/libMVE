.class public Lfreemarker/ext/beans/ArrayModel;
.super Lfreemarker/ext/beans/BeanModel;
.source "ArrayModel.java"

# interfaces
.implements Lfreemarker/template/TemplateCollectionModel;
.implements Lfreemarker/template/TemplateSequenceModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/beans/ArrayModel$Iterator;
    }
.end annotation


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# instance fields
.field private length:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    new-instance v0, Lfreemarker/ext/beans/ArrayModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/ArrayModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/ArrayModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 7
    .param p1, "array"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/BeanModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 102
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 103
    .local v0, "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-nez v1, :cond_2e

    .line 104
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Object is not an array, it\'s "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_2e
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    iput v1, p0, Lfreemarker/ext/beans/ArrayModel;->length:I

    .line 106
    return-void
.end method

.method static access$100(Lfreemarker/ext/beans/ArrayModel;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/ArrayModel;

    .prologue
    .line 71
    iget v0, p0, Lfreemarker/ext/beans/ArrayModel;->length:I

    return v0
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 120
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/ArrayModel;->object:Ljava/lang/Object;

    invoke-static {v1, p1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/ArrayModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 124
    :goto_a
    return-object v1

    .line 122
    :catch_b
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 167
    iget v0, p0, Lfreemarker/ext/beans/ArrayModel;->length:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 3

    .prologue
    .line 111
    new-instance v0, Lfreemarker/ext/beans/ArrayModel$Iterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfreemarker/ext/beans/ArrayModel$Iterator;-><init>(Lfreemarker/ext/beans/ArrayModel;Lfreemarker/ext/beans/ArrayModel$1;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 163
    iget v0, p0, Lfreemarker/ext/beans/ArrayModel;->length:I

    return v0
.end method
