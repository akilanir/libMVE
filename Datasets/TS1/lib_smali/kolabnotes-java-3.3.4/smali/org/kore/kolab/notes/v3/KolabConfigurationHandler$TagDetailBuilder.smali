.class Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;
.super Ljava/lang/Object;
.source "KolabConfigurationHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TagDetailBuilder"
.end annotation


# instance fields
.field private color:Ljava/lang/String;

.field private creationDate:Ljava/sql/Timestamp;

.field private lastModificationDate:Ljava/sql/Timestamp;

.field private final members:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private priority:I

.field private productId:Ljava/lang/String;

.field private relationType:Ljava/lang/String;

.field final synthetic this$0:Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;

.field private type:Ljava/lang/String;

.field private uid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;)V
    .registers 3
    .param p1, "this$0"    # Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->this$0:Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->members:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method build()Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .registers 7

    .prologue
    .line 95
    new-instance v1, Lorg/kore/kolab/notes/Identification;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->uid:Ljava/lang/String;

    iget-object v5, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->productId:Ljava/lang/String;

    invoke-direct {v1, v4, v5}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .local v1, "id":Lorg/kore/kolab/notes/Identification;
    new-instance v0, Lorg/kore/kolab/notes/AuditInformation;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->creationDate:Ljava/sql/Timestamp;

    iget-object v5, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->lastModificationDate:Ljava/sql/Timestamp;

    invoke-direct {v0, v4, v5}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 97
    .local v0, "auditInformation":Lorg/kore/kolab/notes/AuditInformation;
    new-instance v2, Lorg/kore/kolab/notes/Tag;

    invoke-direct {v2, v1, v0}, Lorg/kore/kolab/notes/Tag;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;)V

    .line 98
    .local v2, "tag":Lorg/kore/kolab/notes/Tag;
    iget v4, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->priority:I

    invoke-virtual {v2, v4}, Lorg/kore/kolab/notes/Tag;->setPriority(I)V

    .line 99
    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->name:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/kore/kolab/notes/Tag;->setName(Ljava/lang/String;)V

    .line 100
    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->color:Ljava/lang/String;

    invoke-static {v4}, Lorg/kore/kolab/notes/Colors;->getColor(Ljava/lang/String;)Lorg/kore/kolab/notes/Color;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/kore/kolab/notes/Tag;->setColor(Lorg/kore/kolab/notes/Color;)V

    .line 101
    new-instance v3, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->members:Ljava/util/Set;

    invoke-direct {v3, v1, v0, v2, v4}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Tag;Ljava/util/Set;)V

    .line 103
    .local v3, "tagdetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    const-string v4, "tag"

    iget-object v5, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->relationType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_46

    const-string v4, "relation"

    iget-object v5, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->type:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_46

    .line 106
    .end local v3    # "tagdetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :goto_45
    return-object v3

    .restart local v3    # "tagdetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :cond_46
    const/4 v3, 0x0

    goto :goto_45
.end method

.method convertTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;
    .registers 11
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x13

    const/16 v7, 0x11

    const/16 v6, 0xb

    const/4 v5, 0x5

    const/16 v4, 0xd

    .line 110
    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 111
    .local v0, "calendar":Ljava/util/Calendar;
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 112
    const/4 v1, 0x2

    const/4 v2, 0x7

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 113
    const/16 v1, 0x8

    const/16 v2, 0xa

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v5, v1}, Ljava/util/Calendar;->set(II)V

    .line 114
    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v6, v1}, Ljava/util/Calendar;->set(II)V

    .line 115
    const/16 v1, 0xc

    const/16 v2, 0xe

    const/16 v3, 0x10

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 116
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v8, :cond_8e

    .line 117
    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 122
    :goto_84
    new-instance v1, Ljava/sql/Timestamp;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/sql/Timestamp;-><init>(J)V

    return-object v1

    .line 119
    :cond_8e
    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/util/Calendar;->set(II)V

    goto :goto_84
.end method

.method setValue(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 66
    const-string v0, "uid"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 67
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->uid:Ljava/lang/String;

    .line 92
    :cond_a
    :goto_a
    return-void

    .line 68
    :cond_b
    const-string v0, "prodid"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 69
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->productId:Ljava/lang/String;

    goto :goto_a

    .line 70
    :cond_16
    const-string v0, "creation-date"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 71
    invoke-virtual {p0, p2}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->convertTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->creationDate:Ljava/sql/Timestamp;

    goto :goto_a

    .line 72
    :cond_25
    const-string v0, "last-modification-date"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 73
    invoke-virtual {p0, p2}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->convertTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->lastModificationDate:Ljava/sql/Timestamp;

    goto :goto_a

    .line 74
    :cond_34
    const-string v0, "priority"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    .line 75
    if-eqz p2, :cond_48

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_4c

    :cond_48
    const/4 v0, 0x0

    :goto_49
    iput v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->priority:I

    goto :goto_a

    :cond_4c
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_49

    .line 76
    :cond_55
    const-string v0, "type"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 77
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->type:Ljava/lang/String;

    goto :goto_a

    .line 78
    :cond_60
    const-string v0, "relationType"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 79
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->relationType:Ljava/lang/String;

    goto :goto_a

    .line 80
    :cond_6b
    const-string v0, "name"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    .line 81
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->name:Ljava/lang/String;

    goto :goto_a

    .line 82
    :cond_76
    const-string v0, "color"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_81

    .line 83
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->color:Ljava/lang/String;

    goto :goto_a

    .line 84
    :cond_81
    const-string v0, "member"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 86
    const-string v0, "urn:uuid:"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9e

    .line 87
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->members:Ljava/util/Set;

    const/16 v1, 0x9

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a

    .line 89
    :cond_9e
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->members:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a
.end method
