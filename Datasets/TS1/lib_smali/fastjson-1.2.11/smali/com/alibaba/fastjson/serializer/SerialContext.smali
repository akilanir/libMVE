.class public Lcom/alibaba/fastjson/serializer/SerialContext;
.super Ljava/lang/Object;
.source "SerialContext.java"


# instance fields
.field public final features:I

.field public final fieldName:Ljava/lang/Object;

.field public final object:Ljava/lang/Object;

.field public final parent:Lcom/alibaba/fastjson/serializer/SerialContext;


# direct methods
.method public constructor <init>(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V
    .registers 6
    .param p1, "parent"    # Lcom/alibaba/fastjson/serializer/SerialContext;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "features"    # I
    .param p5, "fieldFeatures"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 12
    iput-object p2, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->object:Ljava/lang/Object;

    .line 13
    iput-object p3, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->fieldName:Ljava/lang/Object;

    .line 14
    iput p4, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->features:I

    .line 15
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 18
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    if-nez v0, :cond_7

    .line 19
    const-string v0, "$"

    .line 24
    :goto_6
    return-object v0

    .line 21
    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->fieldName:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_33

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerialContext;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->fieldName:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 24
    :cond_33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerialContext;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerialContext;->fieldName:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
