.class Lcom/mongodb/QueryOpBuilder;
.super Ljava/lang/Object;
.source "QueryOpBuilder.java"


# static fields
.field static final READ_PREFERENCE_META_OPERATOR:Ljava/lang/String; = "$readPreference"


# instance fields
.field private explain:Z

.field private hintObj:Lcom/mongodb/DBObject;

.field private hintStr:Ljava/lang/String;

.field private maxTimeMS:J

.field private orderBy:Lcom/mongodb/DBObject;

.field private query:Lcom/mongodb/DBObject;

.field private readPref:Lcom/mongodb/ReadPreference;

.field private snapshot:Z

.field private specialFields:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method private addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Lcom/mongodb/DBObject;Z)V
    .registers 6
    .param p1, "dbobj"    # Lcom/mongodb/DBObject;
    .param p2, "field"    # Ljava/lang/String;
    .param p3, "obj"    # Lcom/mongodb/DBObject;
    .param p4, "sendEmpty"    # Z

    .prologue
    .line 196
    if-nez p3, :cond_3

    .line 203
    :cond_2
    :goto_2
    return-void

    .line 199
    :cond_3
    if-nez p4, :cond_f

    invoke-interface {p3}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-eqz v0, :cond_2

    .line 202
    :cond_f
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/QueryOpBuilder;->addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2
.end method

.method private addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "dbobj"    # Lcom/mongodb/DBObject;
    .param p2, "field"    # Ljava/lang/String;
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 214
    if-nez p3, :cond_3

    .line 218
    :goto_2
    return-void

    .line 217
    :cond_3
    invoke-interface {p1, p2, p3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method

.method private hasSpecialQueryFields()Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    .line 168
    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->readPref:Lcom/mongodb/ReadPreference;

    if-eqz v1, :cond_6

    .line 184
    :cond_5
    :goto_5
    return v0

    .line 171
    :cond_6
    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->specialFields:Lcom/mongodb/DBObject;

    if-nez v1, :cond_5

    .line 174
    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->orderBy:Lcom/mongodb/DBObject;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->orderBy:Lcom/mongodb/DBObject;

    invoke-interface {v1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-gtz v1, :cond_5

    .line 177
    :cond_1a
    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->hintStr:Ljava/lang/String;

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->hintObj:Lcom/mongodb/DBObject;

    if-nez v1, :cond_5

    iget-boolean v1, p0, Lcom/mongodb/QueryOpBuilder;->snapshot:Z

    if-nez v1, :cond_5

    iget-boolean v1, p0, Lcom/mongodb/QueryOpBuilder;->explain:Z

    if-nez v1, :cond_5

    .line 180
    iget-wide v1, p0, Lcom/mongodb/QueryOpBuilder;->maxTimeMS:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_5

    .line 184
    const/4 v0, 0x0

    goto :goto_5
.end method


# virtual methods
.method public addExplain(Z)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "explain"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/mongodb/QueryOpBuilder;->explain:Z

    .line 99
    return-object p0
.end method

.method public addHint(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "hint"    # Lcom/mongodb/DBObject;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mongodb/QueryOpBuilder;->hintObj:Lcom/mongodb/DBObject;

    .line 78
    return-object p0
.end method

.method public addHint(Ljava/lang/String;)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "hint"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/mongodb/QueryOpBuilder;->hintStr:Ljava/lang/String;

    .line 68
    return-object p0
.end method

.method public addMaxTimeMS(J)Lcom/mongodb/QueryOpBuilder;
    .registers 3
    .param p1, "maxTimeMS"    # J

    .prologue
    .line 124
    iput-wide p1, p0, Lcom/mongodb/QueryOpBuilder;->maxTimeMS:J

    .line 125
    return-object p0
.end method

.method public addOrderBy(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "orderBy"    # Lcom/mongodb/DBObject;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/mongodb/QueryOpBuilder;->orderBy:Lcom/mongodb/DBObject;

    .line 58
    return-object p0
.end method

.method public addQuery(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/mongodb/QueryOpBuilder;->query:Lcom/mongodb/DBObject;

    .line 48
    return-object p0
.end method

.method public addReadPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "readPref"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/mongodb/QueryOpBuilder;->readPref:Lcom/mongodb/ReadPreference;

    .line 120
    return-object p0
.end method

.method public addSnapshot(Z)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "snapshot"    # Z

    .prologue
    .line 108
    iput-boolean p1, p0, Lcom/mongodb/QueryOpBuilder;->snapshot:Z

    .line 109
    return-object p0
.end method

.method public addSpecialFields(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;
    .registers 2
    .param p1, "specialFields"    # Lcom/mongodb/DBObject;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/mongodb/QueryOpBuilder;->specialFields:Lcom/mongodb/DBObject;

    .line 89
    return-object p0
.end method

.method public get()Lcom/mongodb/DBObject;
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 133
    iget-object v0, p0, Lcom/mongodb/QueryOpBuilder;->query:Lcom/mongodb/DBObject;

    .line 136
    .local v0, "lclQuery":Lcom/mongodb/DBObject;
    if-nez v0, :cond_a

    .line 137
    new-instance v0, Lcom/mongodb/BasicDBObject;

    .end local v0    # "lclQuery":Lcom/mongodb/DBObject;
    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 140
    .restart local v0    # "lclQuery":Lcom/mongodb/DBObject;
    :cond_a
    invoke-direct {p0}, Lcom/mongodb/QueryOpBuilder;->hasSpecialQueryFields()Z

    move-result v2

    if-eqz v2, :cond_84

    .line 141
    iget-object v2, p0, Lcom/mongodb/QueryOpBuilder;->specialFields:Lcom/mongodb/DBObject;

    if-nez v2, :cond_81

    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 143
    .local v1, "queryop":Lcom/mongodb/DBObject;
    :goto_19
    const-string v2, "$query"

    invoke-direct {p0, v1, v2, v0, v5}, Lcom/mongodb/QueryOpBuilder;->addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Lcom/mongodb/DBObject;Z)V

    .line 144
    const-string v2, "$orderby"

    iget-object v3, p0, Lcom/mongodb/QueryOpBuilder;->orderBy:Lcom/mongodb/DBObject;

    const/4 v4, 0x0

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/mongodb/QueryOpBuilder;->addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Lcom/mongodb/DBObject;Z)V

    .line 145
    iget-object v2, p0, Lcom/mongodb/QueryOpBuilder;->hintStr:Ljava/lang/String;

    if-eqz v2, :cond_31

    .line 146
    const-string v2, "$hint"

    iget-object v3, p0, Lcom/mongodb/QueryOpBuilder;->hintStr:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/mongodb/QueryOpBuilder;->addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 147
    :cond_31
    iget-object v2, p0, Lcom/mongodb/QueryOpBuilder;->hintObj:Lcom/mongodb/DBObject;

    if-eqz v2, :cond_3c

    .line 148
    const-string v2, "$hint"

    iget-object v3, p0, Lcom/mongodb/QueryOpBuilder;->hintObj:Lcom/mongodb/DBObject;

    invoke-direct {p0, v1, v2, v3}, Lcom/mongodb/QueryOpBuilder;->addToQueryObject(Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    :cond_3c
    iget-boolean v2, p0, Lcom/mongodb/QueryOpBuilder;->explain:Z

    if-eqz v2, :cond_49

    .line 151
    const-string v2, "$explain"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    :cond_49
    iget-boolean v2, p0, Lcom/mongodb/QueryOpBuilder;->snapshot:Z

    if-eqz v2, :cond_56

    .line 153
    const-string v2, "$snapshot"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    :cond_56
    iget-object v2, p0, Lcom/mongodb/QueryOpBuilder;->readPref:Lcom/mongodb/ReadPreference;

    if-eqz v2, :cond_6d

    iget-object v2, p0, Lcom/mongodb/QueryOpBuilder;->readPref:Lcom/mongodb/ReadPreference;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v3

    if-eq v2, v3, :cond_6d

    .line 155
    const-string v2, "$readPreference"

    iget-object v3, p0, Lcom/mongodb/QueryOpBuilder;->readPref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v3}, Lcom/mongodb/ReadPreference;->toDBObject()Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    :cond_6d
    iget-wide v2, p0, Lcom/mongodb/QueryOpBuilder;->maxTimeMS:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_80

    .line 157
    const-string v2, "$maxTimeMS"

    iget-wide v3, p0, Lcom/mongodb/QueryOpBuilder;->maxTimeMS:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .end local v1    # "queryop":Lcom/mongodb/DBObject;
    :cond_80
    :goto_80
    return-object v1

    .line 141
    :cond_81
    iget-object v1, p0, Lcom/mongodb/QueryOpBuilder;->specialFields:Lcom/mongodb/DBObject;

    goto :goto_19

    :cond_84
    move-object v1, v0

    .line 163
    goto :goto_80
.end method
