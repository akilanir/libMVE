.class Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;
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
    name = "IntBetweenSegement"
.end annotation


# instance fields
.field private final endValue:J

.field private final not:Z

.field private final propertyName:Ljava/lang/String;

.field private final startValue:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JJZ)V
    .registers 7
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "startValue"    # J
    .param p4, "endValue"    # J
    .param p6, "not"    # Z

    .prologue
    .line 1193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1194
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->propertyName:Ljava/lang/String;

    .line 1195
    iput-wide p2, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->startValue:J

    .line 1196
    iput-wide p4, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->endValue:J

    .line 1197
    iput-boolean p6, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->not:Z

    .line 1198
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
    const/4 v3, 0x0

    .line 1201
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v4, v3}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v2

    .line 1203
    .local v2, "propertyValue":Ljava/lang/Object;
    if-nez v2, :cond_a

    .line 1214
    .end local v2    # "propertyValue":Ljava/lang/Object;
    :cond_9
    :goto_9
    return v3

    .line 1207
    .restart local v2    # "propertyValue":Ljava/lang/Object;
    :cond_a
    instance-of v4, v2, Ljava/lang/Number;

    if-eqz v4, :cond_26

    .line 1208
    check-cast v2, Ljava/lang/Number;

    .end local v2    # "propertyValue":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 1209
    .local v0, "longPropertyValue":J
    iget-wide v4, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->startValue:J

    cmp-long v4, v0, v4

    if-ltz v4, :cond_26

    iget-wide v4, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->endValue:J

    cmp-long v4, v0, v4

    if-gtz v4, :cond_26

    .line 1210
    iget-boolean v4, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->not:Z

    if-nez v4, :cond_9

    const/4 v3, 0x1

    goto :goto_9

    .line 1214
    .end local v0    # "longPropertyValue":J
    :cond_26
    iget-boolean v3, p0, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;->not:Z

    goto :goto_9
.end method
