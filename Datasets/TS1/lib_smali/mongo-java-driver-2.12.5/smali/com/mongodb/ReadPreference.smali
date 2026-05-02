.class public abstract Lcom/mongodb/ReadPreference;
.super Ljava/lang/Object;
.source "ReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ReadPreference$1;,
        Lcom/mongodb/ReadPreference$TaggedReadPreference;,
        Lcom/mongodb/ReadPreference$PrimaryReadPreference;
    }
.end annotation


# static fields
.field public static final PRIMARY:Lcom/mongodb/ReadPreference;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final SECONDARY:Lcom/mongodb/ReadPreference;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final _NEAREST:Lcom/mongodb/ReadPreference;

.field private static final _PRIMARY:Lcom/mongodb/ReadPreference;

.field private static final _PRIMARY_PREFERRED:Lcom/mongodb/ReadPreference;

.field private static final _SECONDARY:Lcom/mongodb/ReadPreference;

.field private static final _SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 335
    new-instance v0, Lcom/mongodb/ReadPreference$PrimaryReadPreference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mongodb/ReadPreference$PrimaryReadPreference;-><init>(Lcom/mongodb/ReadPreference$1;)V

    sput-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY:Lcom/mongodb/ReadPreference;

    .line 336
    new-instance v0, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;

    invoke-direct {v0}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>()V

    sput-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY:Lcom/mongodb/ReadPreference;

    .line 337
    new-instance v0, Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;

    invoke-direct {v0}, Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;-><init>()V

    sput-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;

    .line 338
    new-instance v0, Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;

    invoke-direct {v0}, Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;-><init>()V

    sput-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY_PREFERRED:Lcom/mongodb/ReadPreference;

    .line 339
    new-instance v0, Lcom/mongodb/TaggableReadPreference$NearestReadPreference;

    invoke-direct {v0}, Lcom/mongodb/TaggableReadPreference$NearestReadPreference;-><init>()V

    sput-object v0, Lcom/mongodb/ReadPreference;->_NEAREST:Lcom/mongodb/ReadPreference;

    .line 341
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY:Lcom/mongodb/ReadPreference;

    sput-object v0, Lcom/mongodb/ReadPreference;->PRIMARY:Lcom/mongodb/ReadPreference;

    .line 342
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;

    sput-object v0, Lcom/mongodb/ReadPreference;->SECONDARY:Lcom/mongodb/ReadPreference;

    .line 343
    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static nearest()Lcom/mongodb/ReadPreference;
    .registers 1

    .prologue
    .line 228
    sget-object v0, Lcom/mongodb/ReadPreference;->_NEAREST:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public static varargs nearest(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/TaggableReadPreference;
    .registers 3
    .param p0, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p1, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 284
    new-instance v0, Lcom/mongodb/TaggableReadPreference$NearestReadPreference;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/TaggableReadPreference$NearestReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    return-object v0
.end method

.method public static primary()Lcom/mongodb/ReadPreference;
    .registers 1

    .prologue
    .line 179
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public static primaryPreferred()Lcom/mongodb/ReadPreference;
    .registers 1

    .prologue
    .line 186
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY_PREFERRED:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public static varargs primaryPreferred(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/TaggableReadPreference;
    .registers 3
    .param p0, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p1, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 193
    new-instance v0, Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    return-object v0
.end method

.method public static secondary()Lcom/mongodb/ReadPreference;
    .registers 1

    .prologue
    .line 200
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public static varargs secondary(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/TaggableReadPreference;
    .registers 3
    .param p0, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p1, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 207
    new-instance v0, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    return-object v0
.end method

.method public static secondaryPreferred()Lcom/mongodb/ReadPreference;
    .registers 1

    .prologue
    .line 214
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public static varargs secondaryPreferred(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/TaggableReadPreference;
    .registers 3
    .param p0, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p1, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 221
    new-instance v0, Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/ReadPreference;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 232
    if-nez p0, :cond_8

    .line 233
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 236
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 238
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 239
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY:Lcom/mongodb/ReadPreference;

    .line 251
    :goto_1e
    return-object v0

    .line 241
    :cond_1f
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 242
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY:Lcom/mongodb/ReadPreference;

    goto :goto_1e

    .line 244
    :cond_32
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 245
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;

    goto :goto_1e

    .line 247
    :cond_45
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY_PREFERRED:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 248
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY_PREFERRED:Lcom/mongodb/ReadPreference;

    goto :goto_1e

    .line 250
    :cond_58
    sget-object v0, Lcom/mongodb/ReadPreference;->_NEAREST:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 251
    sget-object v0, Lcom/mongodb/ReadPreference;->_NEAREST:Lcom/mongodb/ReadPreference;

    goto :goto_1e

    .line 254
    :cond_6b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No match for read preference of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static varargs valueOf(Ljava/lang/String;Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/TaggableReadPreference;
    .registers 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p2, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 258
    if-nez p0, :cond_8

    .line 259
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 262
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 264
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 265
    new-instance v0, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;

    invoke-direct {v0, p1, p2}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    .line 274
    :goto_21
    return-object v0

    .line 267
    :cond_22
    sget-object v0, Lcom/mongodb/ReadPreference;->_SECONDARY_PREFERRED:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 268
    new-instance v0, Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;

    invoke-direct {v0, p1, p2}, Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    goto :goto_21

    .line 270
    :cond_38
    sget-object v0, Lcom/mongodb/ReadPreference;->_PRIMARY_PREFERRED:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 271
    new-instance v0, Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;

    invoke-direct {v0, p1, p2}, Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    goto :goto_21

    .line 273
    :cond_4e
    sget-object v0, Lcom/mongodb/ReadPreference;->_NEAREST:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_64

    .line 274
    new-instance v0, Lcom/mongodb/TaggableReadPreference$NearestReadPreference;

    invoke-direct {v0, p1, p2}, Lcom/mongodb/TaggableReadPreference$NearestReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    goto :goto_21

    .line 277
    :cond_64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No match for read preference of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static withTags(Lcom/mongodb/DBObject;)Lcom/mongodb/ReadPreference;
    .registers 2
    .param p0, "tags"    # Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 325
    new-instance v0, Lcom/mongodb/ReadPreference$TaggedReadPreference;

    invoke-direct {v0, p0}, Lcom/mongodb/ReadPreference$TaggedReadPreference;-><init>(Lcom/mongodb/DBObject;)V

    return-object v0
.end method

.method public static withTags(Ljava/util/Map;)Lcom/mongodb/ReadPreference;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/mongodb/ReadPreference;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 316
    .local p0, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/mongodb/ReadPreference$TaggedReadPreference;

    invoke-direct {v0, p0}, Lcom/mongodb/ReadPreference$TaggedReadPreference;-><init>(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method abstract choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract isSlaveOk()Z
.end method

.method public abstract toDBObject()Lcom/mongodb/DBObject;
.end method
