.class public Lde/greenrobot/dao/query/WhereCondition$StringCondition;
.super Lde/greenrobot/dao/query/WhereCondition$AbstractCondition;
.source "WhereCondition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/greenrobot/dao/query/WhereCondition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StringCondition"
.end annotation


# instance fields
.field protected final string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-direct {p0}, Lde/greenrobot/dao/query/WhereCondition$AbstractCondition;-><init>()V

    .line 151
    iput-object p1, p0, Lde/greenrobot/dao/query/WhereCondition$StringCondition;->string:Ljava/lang/String;

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 155
    invoke-direct {p0, p2}, Lde/greenrobot/dao/query/WhereCondition$AbstractCondition;-><init>(Ljava/lang/Object;)V

    .line 156
    iput-object p1, p0, Lde/greenrobot/dao/query/WhereCondition$StringCondition;->string:Ljava/lang/String;

    .line 157
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/Object;

    .prologue
    .line 160
    invoke-direct {p0, p2}, Lde/greenrobot/dao/query/WhereCondition$AbstractCondition;-><init>([Ljava/lang/Object;)V

    .line 161
    iput-object p1, p0, Lde/greenrobot/dao/query/WhereCondition$StringCondition;->string:Ljava/lang/String;

    .line 162
    return-void
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .registers 4
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "tableAlias"    # Ljava/lang/String;

    .prologue
    .line 166
    iget-object v0, p0, Lde/greenrobot/dao/query/WhereCondition$StringCondition;->string:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    return-void
.end method
