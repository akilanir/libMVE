.class Lcom/alibaba/fastjson/JSONPath$MatchSegement;
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
    name = "MatchSegement"
.end annotation


# instance fields
.field private final containsValues:[Ljava/lang/String;

.field private final endsWithValue:Ljava/lang/String;

.field private final minLength:I

.field private final not:Z

.field private final propertyName:Ljava/lang/String;

.field private final startsWithValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V
    .registers 11
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "startsWithValue"    # Ljava/lang/String;
    .param p3, "endsWithValue"    # Ljava/lang/String;
    .param p4, "containsValues"    # [Ljava/lang/String;
    .param p5, "not"    # Z

    .prologue
    .line 1341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1342
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->propertyName:Ljava/lang/String;

    .line 1343
    iput-object p2, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->startsWithValue:Ljava/lang/String;

    .line 1344
    iput-object p3, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->endsWithValue:Ljava/lang/String;

    .line 1345
    iput-object p4, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->containsValues:[Ljava/lang/String;

    .line 1346
    iput-boolean p5, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->not:Z

    .line 1348
    const/4 v1, 0x0

    .line 1349
    .local v1, "len":I
    if-eqz p2, :cond_15

    .line 1350
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    .line 1353
    :cond_15
    if-eqz p3, :cond_1c

    .line 1354
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    .line 1357
    :cond_1c
    if-eqz p4, :cond_2c

    .line 1358
    array-length v3, p4

    const/4 v2, 0x0

    :goto_20
    if-ge v2, v3, :cond_2c

    aget-object v0, p4, v2

    .line 1359
    .local v0, "item":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v1, v4

    .line 1358
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 1363
    .end local v0    # "item":Ljava/lang/String;
    :cond_2c
    iput v1, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->minLength:I

    .line 1364
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 15
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 1367
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v6, v5}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v2

    .line 1369
    .local v2, "propertyValue":Ljava/lang/Object;
    if-nez v2, :cond_a

    .line 1403
    :cond_9
    :goto_9
    return v5

    .line 1373
    :cond_a
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1375
    .local v4, "strPropertyValue":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    iget v7, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->minLength:I

    if-ge v6, v7, :cond_19

    .line 1376
    iget-boolean v5, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->not:Z

    goto :goto_9

    .line 1379
    :cond_19
    const/4 v3, 0x0

    .line 1380
    .local v3, "start":I
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->startsWithValue:Ljava/lang/String;

    if-eqz v6, :cond_30

    .line 1381
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->startsWithValue:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_29

    .line 1382
    iget-boolean v5, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->not:Z

    goto :goto_9

    .line 1384
    :cond_29
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->startsWithValue:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v3, v6

    .line 1387
    :cond_30
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->containsValues:[Ljava/lang/String;

    if-eqz v6, :cond_4f

    .line 1388
    iget-object v7, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->containsValues:[Ljava/lang/String;

    array-length v8, v7

    move v6, v5

    :goto_38
    if-ge v6, v8, :cond_4f

    aget-object v0, v7, v6

    .line 1389
    .local v0, "containsValue":Ljava/lang/String;
    invoke-virtual {v4, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1390
    .local v1, "index":I
    const/4 v9, -0x1

    if-ne v1, v9, :cond_46

    .line 1391
    iget-boolean v5, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->not:Z

    goto :goto_9

    .line 1393
    :cond_46
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    add-int v3, v1, v9

    .line 1388
    add-int/lit8 v6, v6, 0x1

    goto :goto_38

    .line 1397
    .end local v0    # "containsValue":Ljava/lang/String;
    .end local v1    # "index":I
    :cond_4f
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->endsWithValue:Ljava/lang/String;

    if-eqz v6, :cond_5e

    .line 1398
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->endsWithValue:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_5e

    .line 1399
    iget-boolean v5, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->not:Z

    goto :goto_9

    .line 1403
    :cond_5e
    iget-boolean v6, p0, Lcom/alibaba/fastjson/JSONPath$MatchSegement;->not:Z

    if-nez v6, :cond_9

    const/4 v5, 0x1

    goto :goto_9
.end method
