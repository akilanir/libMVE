.class final Lfreemarker/template/utility/Constants$2;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Lfreemarker/template/TemplateCollectionModel;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 104
    sget-object v0, Lfreemarker/template/utility/Constants;->EMPTY_ITERATOR:Lfreemarker/template/TemplateModelIterator;

    return-object v0
.end method
