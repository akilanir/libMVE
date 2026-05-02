.class public Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;
.super Ljava/lang/Object;
.source "IMAPMessage.java"

# interfaces
.implements Lcom/sun/mail/imap/Utility$Condition;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/imap/IMAPMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FetchProfileCondition"
.end annotation


# instance fields
.field private hdrs:[Ljava/lang/String;

.field private need:Ljava/util/Set;

.field private needBodyStructure:Z

.field private needEnvelope:Z

.field private needFlags:Z

.field private needHeaders:Z

.field private needMessage:Z

.field private needSize:Z

.field private needUID:Z


# direct methods
.method public constructor <init>(Lkorex/mail/FetchProfile;[Lcom/sun/mail/imap/protocol/FetchItem;)V
    .registers 6
    .param p1, "fp"    # Lkorex/mail/FetchProfile;
    .param p2, "fitems"    # [Lcom/sun/mail/imap/protocol/FetchItem;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1097
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needEnvelope:Z

    .line 1098
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needFlags:Z

    .line 1099
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needBodyStructure:Z

    .line 1100
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needUID:Z

    .line 1101
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needHeaders:Z

    .line 1102
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needSize:Z

    .line 1103
    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needMessage:Z

    .line 1104
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->hdrs:[Ljava/lang/String;

    .line 1105
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->need:Ljava/util/Set;

    .line 1115
    sget-object v1, Lkorex/mail/FetchProfile$Item;->ENVELOPE:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 1116
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needEnvelope:Z

    .line 1117
    :cond_27
    sget-object v1, Lkorex/mail/FetchProfile$Item;->FLAGS:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 1118
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needFlags:Z

    .line 1119
    :cond_31
    sget-object v1, Lkorex/mail/FetchProfile$Item;->CONTENT_INFO:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 1120
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needBodyStructure:Z

    .line 1121
    :cond_3b
    sget-object v1, Lkorex/mail/FetchProfile$Item;->SIZE:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 1122
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needSize:Z

    .line 1123
    :cond_45
    sget-object v1, Lkorex/mail/UIDFolder$FetchProfileItem;->UID:Lkorex/mail/UIDFolder$FetchProfileItem;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 1124
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needUID:Z

    .line 1125
    :cond_4f
    sget-object v1, Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;->HEADERS:Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_59

    .line 1126
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needHeaders:Z

    .line 1127
    :cond_59
    sget-object v1, Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;->SIZE:Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_63

    .line 1128
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needSize:Z

    .line 1129
    :cond_63
    sget-object v1, Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;->MESSAGE:Lcom/sun/mail/imap/IMAPFolder$FetchProfileItem;

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_6d

    .line 1130
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needMessage:Z

    .line 1131
    :cond_6d
    invoke-virtual {p1}, Lkorex/mail/FetchProfile;->getHeaderNames()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->hdrs:[Ljava/lang/String;

    .line 1132
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_74
    array-length v1, p2

    if-ge v0, v1, :cond_8d

    .line 1133
    aget-object v1, p2, v0

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/FetchItem;->getFetchProfileItem()Lkorex/mail/FetchProfile$Item;

    move-result-object v1

    invoke-virtual {p1, v1}, Lkorex/mail/FetchProfile;->contains(Lkorex/mail/FetchProfile$Item;)Z

    move-result v1

    if-eqz v1, :cond_8a

    .line 1134
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->need:Ljava/util/Set;

    aget-object v2, p2, v0

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1132
    :cond_8a
    add-int/lit8 v0, v0, 0x1

    goto :goto_74

    .line 1136
    :cond_8d
    return-void
.end method


# virtual methods
.method public test(Lcom/sun/mail/imap/IMAPMessage;)Z
    .registers 10
    .param p1, "m"    # Lcom/sun/mail/imap/IMAPMessage;

    .prologue
    const/4 v3, 0x1

    .line 1143
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needEnvelope:Z

    if-eqz v4, :cond_12

    # invokes: Lcom/sun/mail/imap/IMAPMessage;->_getEnvelope()Lcom/sun/mail/imap/protocol/ENVELOPE;
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$000(Lcom/sun/mail/imap/IMAPMessage;)Lcom/sun/mail/imap/protocol/ENVELOPE;

    move-result-object v4

    if-nez v4, :cond_12

    # getter for: Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$100(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 1171
    :cond_11
    :goto_11
    return v3

    .line 1145
    :cond_12
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needFlags:Z

    if-eqz v4, :cond_1c

    # invokes: Lcom/sun/mail/imap/IMAPMessage;->_getFlags()Lkorex/mail/Flags;
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$200(Lcom/sun/mail/imap/IMAPMessage;)Lkorex/mail/Flags;

    move-result-object v4

    if-eqz v4, :cond_11

    .line 1147
    :cond_1c
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needBodyStructure:Z

    if-eqz v4, :cond_2c

    # invokes: Lcom/sun/mail/imap/IMAPMessage;->_getBodyStructure()Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$300(Lcom/sun/mail/imap/IMAPMessage;)Lcom/sun/mail/imap/protocol/BODYSTRUCTURE;

    move-result-object v4

    if-nez v4, :cond_2c

    .line 1148
    # getter for: Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$100(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1150
    :cond_2c
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needUID:Z

    if-eqz v4, :cond_3a

    invoke-virtual {p1}, Lcom/sun/mail/imap/IMAPMessage;->getUID()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_11

    .line 1152
    :cond_3a
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needHeaders:Z

    if-eqz v4, :cond_44

    # invokes: Lcom/sun/mail/imap/IMAPMessage;->areHeadersLoaded()Z
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$400(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1154
    :cond_44
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needSize:Z

    if-eqz v4, :cond_55

    # getter for: Lcom/sun/mail/imap/IMAPMessage;->size:I
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$500(Lcom/sun/mail/imap/IMAPMessage;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_55

    # getter for: Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$100(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1156
    :cond_55
    iget-boolean v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->needMessage:Z

    if-eqz v4, :cond_5f

    # getter for: Lcom/sun/mail/imap/IMAPMessage;->bodyLoaded:Z
    invoke-static {p1}, Lcom/sun/mail/imap/IMAPMessage;->access$100(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1160
    :cond_5f
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_60
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->hdrs:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_72

    .line 1161
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->hdrs:[Ljava/lang/String;

    aget-object v4, v4, v1

    # invokes: Lcom/sun/mail/imap/IMAPMessage;->isHeaderLoaded(Ljava/lang/String;)Z
    invoke-static {p1, v4}, Lcom/sun/mail/imap/IMAPMessage;->access$600(Lcom/sun/mail/imap/IMAPMessage;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1160
    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    .line 1164
    :cond_72
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPMessage$FetchProfileCondition;->need:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1165
    .local v2, "it":Ljava/util/Iterator;
    :cond_78
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_96

    .line 1166
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/imap/protocol/FetchItem;

    .line 1167
    .local v0, "fitem":Lcom/sun/mail/imap/protocol/FetchItem;
    iget-object v4, p1, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    if-eqz v4, :cond_11

    iget-object v4, p1, Lcom/sun/mail/imap/IMAPMessage;->items:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/FetchItem;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_78

    goto/16 :goto_11

    .line 1171
    .end local v0    # "fitem":Lcom/sun/mail/imap/protocol/FetchItem;
    :cond_96
    const/4 v3, 0x0

    goto/16 :goto_11
.end method
