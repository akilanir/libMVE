.class Lfreemarker/ext/beans/ArrayModel$Iterator;
.super Ljava/lang/Object;
.source "ArrayModel.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateModelIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/beans/ArrayModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Iterator"
.end annotation


# instance fields
.field private position:I

.field private final this$0:Lfreemarker/ext/beans/ArrayModel;


# direct methods
.method private constructor <init>(Lfreemarker/ext/beans/ArrayModel;)V
    .registers 3

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->this$0:Lfreemarker/ext/beans/ArrayModel;

    .line 134
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->position:I

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/beans/ArrayModel;Lfreemarker/ext/beans/ArrayModel$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/beans/ArrayModel;
    .param p2, "x1"    # Lfreemarker/ext/beans/ArrayModel$1;

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lfreemarker/ext/beans/ArrayModel$Iterator;-><init>(Lfreemarker/ext/beans/ArrayModel;)V

    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->this$0:Lfreemarker/ext/beans/ArrayModel;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/ArrayModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .registers 3

    .prologue
    .line 138
    iget v0, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->position:I

    iget-object v1, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->this$0:Lfreemarker/ext/beans/ArrayModel;

    invoke-static {v1}, Lfreemarker/ext/beans/ArrayModel;->access$100(Lfreemarker/ext/beans/ArrayModel;)I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 152
    iget v0, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->position:I

    iget-object v1, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->this$0:Lfreemarker/ext/beans/ArrayModel;

    invoke-static {v1}, Lfreemarker/ext/beans/ArrayModel;->access$100(Lfreemarker/ext/beans/ArrayModel;)I

    move-result v1

    if-ge v0, v1, :cond_15

    iget v0, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->position:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->position:I

    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/ArrayModel$Iterator;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public size()I
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lfreemarker/ext/beans/ArrayModel$Iterator;->this$0:Lfreemarker/ext/beans/ArrayModel;

    invoke-virtual {v0}, Lfreemarker/ext/beans/ArrayModel;->size()I

    move-result v0

    return v0
.end method
