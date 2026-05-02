.class Lcom/alibaba/fastjson/JSONPath$StringOpSegement;
.super Ljava/lang/Object;
.source "JSONPath.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StringOpSegement"
.end annotation


# instance fields
.field private final op:Lcom/alibaba/fastjson/JSONPath$Operator;

.field private final propertyName:Ljava/lang/String;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Operator;)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "op"    # Lcom/alibaba/fastjson/JSONPath$Operator;

    .prologue
    .line 1444
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1445
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->propertyName:Ljava/lang/String;

    .line 1446
    iput-object p2, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->value:Ljava/lang/String;

    .line 1447
    iput-object p3, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1448
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 11
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1451
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v4, v3}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v1

    .line 1453
    .local v1, "propertyValue":Ljava/lang/Object;
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v4, v5, :cond_15

    .line 1454
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->value:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1474
    :cond_14
    :goto_14
    return v2

    .line 1455
    :cond_15
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v4, v5, :cond_25

    .line 1456
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->value:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    move v2, v3

    goto :goto_14

    .line 1459
    :cond_25
    if-nez v1, :cond_29

    move v2, v3

    .line 1460
    goto :goto_14

    .line 1463
    :cond_29
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->value:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 1464
    .local v0, "compareResult":I
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->GE:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v4, v5, :cond_3d

    .line 1465
    if-lez v0, :cond_14

    move v2, v3

    goto :goto_14

    .line 1466
    :cond_3d
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->GT:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v4, v5, :cond_47

    .line 1467
    if-ltz v0, :cond_14

    move v2, v3

    goto :goto_14

    .line 1468
    :cond_47
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->LE:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v4, v5, :cond_51

    .line 1469
    if-gez v0, :cond_14

    move v2, v3

    goto :goto_14

    .line 1470
    :cond_51
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->LT:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v4, v5, :cond_5b

    .line 1471
    if-gtz v0, :cond_14

    move v2, v3

    goto :goto_14

    :cond_5b
    move v2, v3

    .line 1474
    goto :goto_14
.end method
