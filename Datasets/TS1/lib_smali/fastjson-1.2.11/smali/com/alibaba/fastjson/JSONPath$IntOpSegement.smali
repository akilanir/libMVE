.class Lcom/alibaba/fastjson/JSONPath$IntOpSegement;
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
    name = "IntOpSegement"
.end annotation


# instance fields
.field private final op:Lcom/alibaba/fastjson/JSONPath$Operator;

.field private final propertyName:Ljava/lang/String;

.field private final value:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/alibaba/fastjson/JSONPath$Operator;)V
    .registers 5
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "value"    # J
    .param p4, "op"    # Lcom/alibaba/fastjson/JSONPath$Operator;

    .prologue
    .line 1293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1294
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->propertyName:Ljava/lang/String;

    .line 1295
    iput-wide p2, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    .line 1296
    iput-object p4, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 1297
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 12
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1300
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v5, v4}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v2

    .line 1302
    .local v2, "propertyValue":Ljava/lang/Object;
    if-nez v2, :cond_c

    move v3, v4

    .line 1326
    .end local v2    # "propertyValue":Ljava/lang/Object;
    :cond_b
    :goto_b
    return v3

    .line 1306
    .restart local v2    # "propertyValue":Ljava/lang/Object;
    :cond_c
    instance-of v5, v2, Ljava/lang/Number;

    if-nez v5, :cond_12

    move v3, v4

    .line 1307
    goto :goto_b

    .line 1310
    :cond_12
    check-cast v2, Ljava/lang/Number;

    .end local v2    # "propertyValue":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 1312
    .local v0, "longValue":J
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v6, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v5, v6, :cond_26

    .line 1313
    iget-wide v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    cmp-long v5, v0, v5

    if-eqz v5, :cond_b

    move v3, v4

    goto :goto_b

    .line 1314
    :cond_26
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v6, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v5, v6, :cond_34

    .line 1315
    iget-wide v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    cmp-long v5, v0, v5

    if-nez v5, :cond_b

    move v3, v4

    goto :goto_b

    .line 1316
    :cond_34
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v6, Lcom/alibaba/fastjson/JSONPath$Operator;->GE:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v5, v6, :cond_42

    .line 1317
    iget-wide v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    cmp-long v5, v0, v5

    if-gez v5, :cond_b

    move v3, v4

    goto :goto_b

    .line 1318
    :cond_42
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v6, Lcom/alibaba/fastjson/JSONPath$Operator;->GT:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v5, v6, :cond_50

    .line 1319
    iget-wide v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    cmp-long v5, v0, v5

    if-gtz v5, :cond_b

    move v3, v4

    goto :goto_b

    .line 1320
    :cond_50
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v6, Lcom/alibaba/fastjson/JSONPath$Operator;->LE:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v5, v6, :cond_5e

    .line 1321
    iget-wide v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    cmp-long v5, v0, v5

    if-lez v5, :cond_b

    move v3, v4

    goto :goto_b

    .line 1322
    :cond_5e
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->op:Lcom/alibaba/fastjson/JSONPath$Operator;

    sget-object v6, Lcom/alibaba/fastjson/JSONPath$Operator;->LT:Lcom/alibaba/fastjson/JSONPath$Operator;

    if-ne v5, v6, :cond_6c

    .line 1323
    iget-wide v5, p0, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;->value:J

    cmp-long v5, v0, v5

    if-ltz v5, :cond_b

    move v3, v4

    goto :goto_b

    :cond_6c
    move v3, v4

    .line 1326
    goto :goto_b
.end method
