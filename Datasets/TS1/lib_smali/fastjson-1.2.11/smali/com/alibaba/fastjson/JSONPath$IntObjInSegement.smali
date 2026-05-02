.class Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;
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
    name = "IntObjInSegement"
.end annotation


# instance fields
.field private final not:Z

.field private final propertyName:Ljava/lang/String;

.field private final values:[Ljava/lang/Long;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljava/lang/Long;Z)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/Long;
    .param p3, "not"    # Z

    .prologue
    .line 1224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1225
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->propertyName:Ljava/lang/String;

    .line 1226
    iput-object p2, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->values:[Ljava/lang/Long;

    .line 1227
    iput-boolean p3, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->not:Z

    .line 1228
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 16
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1231
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v6, v5}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v2

    .line 1233
    .local v2, "propertyValue":Ljava/lang/Object;
    if-nez v2, :cond_21

    .line 1234
    iget-object v7, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->values:[Ljava/lang/Long;

    array-length v8, v7

    move v6, v5

    :goto_e
    if-ge v6, v8, :cond_1e

    aget-object v3, v7, v6

    .line 1235
    .local v3, "value":Ljava/lang/Long;
    if-nez v3, :cond_1b

    .line 1236
    iget-boolean v6, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->not:Z

    if-nez v6, :cond_19

    .line 1256
    .end local v2    # "propertyValue":Ljava/lang/Object;
    .end local v3    # "value":Ljava/lang/Long;
    :cond_18
    :goto_18
    return v4

    .restart local v2    # "propertyValue":Ljava/lang/Object;
    .restart local v3    # "value":Ljava/lang/Long;
    :cond_19
    move v4, v5

    .line 1236
    goto :goto_18

    .line 1234
    :cond_1b
    add-int/lit8 v6, v6, 0x1

    goto :goto_e

    .line 1240
    .end local v3    # "value":Ljava/lang/Long;
    :cond_1e
    iget-boolean v4, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->not:Z

    goto :goto_18

    .line 1243
    :cond_21
    instance-of v6, v2, Ljava/lang/Number;

    if-eqz v6, :cond_46

    .line 1244
    check-cast v2, Ljava/lang/Number;

    .end local v2    # "propertyValue":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 1245
    .local v0, "longPropertyValue":J
    iget-object v7, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->values:[Ljava/lang/Long;

    array-length v8, v7

    move v6, v5

    :goto_2f
    if-ge v6, v8, :cond_46

    aget-object v3, v7, v6

    .line 1246
    .restart local v3    # "value":Ljava/lang/Long;
    if-nez v3, :cond_38

    .line 1245
    :cond_35
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    .line 1250
    :cond_38
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    cmp-long v9, v9, v0

    if-nez v9, :cond_35

    .line 1251
    iget-boolean v6, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->not:Z

    if-eqz v6, :cond_18

    move v4, v5

    goto :goto_18

    .line 1256
    .end local v0    # "longPropertyValue":J
    .end local v3    # "value":Ljava/lang/Long;
    :cond_46
    iget-boolean v4, p0, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;->not:Z

    goto :goto_18
.end method
