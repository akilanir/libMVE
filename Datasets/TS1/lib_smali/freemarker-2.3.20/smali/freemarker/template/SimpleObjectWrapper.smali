.class public Lfreemarker/template/SimpleObjectWrapper;
.super Lfreemarker/template/DefaultObjectWrapper;
.source "SimpleObjectWrapper.java"


# static fields
.field static final instance:Lfreemarker/template/SimpleObjectWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    new-instance v0, Lfreemarker/template/SimpleObjectWrapper;

    invoke-direct {v0}, Lfreemarker/template/SimpleObjectWrapper;-><init>()V

    sput-object v0, Lfreemarker/template/SimpleObjectWrapper;->instance:Lfreemarker/template/SimpleObjectWrapper;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Lfreemarker/template/DefaultObjectWrapper;-><init>()V

    return-void
.end method


# virtual methods
.method protected handleUnknownType(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Lfreemarker/template/TemplateModelException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Don\'t know how to present an object of this type to a template: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
