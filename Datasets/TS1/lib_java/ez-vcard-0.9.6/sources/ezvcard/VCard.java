package ezvcard;

import ezvcard.parameter.EmailType;
import ezvcard.parameter.TelephoneType;
import ezvcard.property.Address;
import ezvcard.property.Agent;
import ezvcard.property.Anniversary;
import ezvcard.property.Birthday;
import ezvcard.property.Birthplace;
import ezvcard.property.CalendarRequestUri;
import ezvcard.property.CalendarUri;
import ezvcard.property.Categories;
import ezvcard.property.Classification;
import ezvcard.property.ClientPidMap;
import ezvcard.property.Deathdate;
import ezvcard.property.Deathplace;
import ezvcard.property.Email;
import ezvcard.property.Expertise;
import ezvcard.property.FormattedName;
import ezvcard.property.FreeBusyUrl;
import ezvcard.property.Gender;
import ezvcard.property.Geo;
import ezvcard.property.HasAltId;
import ezvcard.property.Hobby;
import ezvcard.property.Impp;
import ezvcard.property.Interest;
import ezvcard.property.Key;
import ezvcard.property.Kind;
import ezvcard.property.Label;
import ezvcard.property.Language;
import ezvcard.property.Logo;
import ezvcard.property.Mailer;
import ezvcard.property.Member;
import ezvcard.property.Nickname;
import ezvcard.property.Note;
import ezvcard.property.OrgDirectory;
import ezvcard.property.Organization;
import ezvcard.property.Photo;
import ezvcard.property.ProductId;
import ezvcard.property.Profile;
import ezvcard.property.RawProperty;
import ezvcard.property.Related;
import ezvcard.property.Revision;
import ezvcard.property.Role;
import ezvcard.property.SortString;
import ezvcard.property.Sound;
import ezvcard.property.Source;
import ezvcard.property.SourceDisplayText;
import ezvcard.property.StructuredName;
import ezvcard.property.Telephone;
import ezvcard.property.Timezone;
import ezvcard.property.Title;
import ezvcard.property.Uid;
import ezvcard.property.Url;
import ezvcard.property.VCardProperty;
import ezvcard.property.Xml;
import ezvcard.util.ListMultimap;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.xml.transform.TransformerException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/VCard.class */
public class VCard implements Iterable<VCardProperty> {
    private VCardVersion version = VCardVersion.V3_0;
    private final ListMultimap<Class<? extends VCardProperty>, VCardProperty> properties = new ListMultimap<>();

    public String write() {
        return Ezvcard.write(this).go();
    }

    public void write(File file) throws IOException {
        Ezvcard.write(this).go(file);
    }

    public void write(OutputStream out) throws IOException {
        Ezvcard.write(this).go(out);
    }

    public void write(Writer writer) throws IOException {
        Ezvcard.write(this).go(writer);
    }

    public String writeXml() {
        return Ezvcard.writeXml(this).indent(2).go();
    }

    public void writeXml(File file) throws IOException, TransformerException {
        Ezvcard.writeXml(this).indent(2).go(file);
    }

    public void writeXml(OutputStream out) throws TransformerException {
        Ezvcard.writeXml(this).indent(2).go(out);
    }

    public void writeXml(Writer writer) throws TransformerException {
        Ezvcard.writeXml(this).indent(2).go(writer);
    }

    public String writeHtml() {
        return Ezvcard.writeHtml(this).go();
    }

    public void writeHtml(File file) throws IOException {
        Ezvcard.writeHtml(this).go(file);
    }

    public void writeHtml(OutputStream out) throws IOException {
        Ezvcard.writeHtml(this).go(out);
    }

    public void writeHtml(Writer writer) throws IOException {
        Ezvcard.writeHtml(this).go(writer);
    }

    public String writeJson() {
        return Ezvcard.writeJson(this).go();
    }

    public void writeJson(File file) throws IOException {
        Ezvcard.writeJson(this).go(file);
    }

    public void writeJson(OutputStream out) throws IOException {
        Ezvcard.writeJson(this).go(out);
    }

    public void writeJson(Writer writer) throws IOException {
        Ezvcard.writeJson(this).go(writer);
    }

    public VCardVersion getVersion() {
        return this.version;
    }

    public void setVersion(VCardVersion version) {
        this.version = version;
    }

    public Kind getKind() {
        return (Kind) getProperty(Kind.class);
    }

    public void setKind(Kind kind) {
        setProperty(Kind.class, kind);
    }

    public Gender getGender() {
        return (Gender) getProperty(Gender.class);
    }

    public void setGender(Gender gender) {
        setProperty(Gender.class, gender);
    }

    public List<Member> getMembers() {
        return getProperties(Member.class);
    }

    public void addMember(Member member) {
        addProperty(member);
    }

    public void addMemberAlt(Collection<Member> altRepresentations) {
        addPropertyAlt(Member.class, altRepresentations);
    }

    public void addMemberAlt(Member... altRepresentations) {
        addPropertyAlt(Member.class, altRepresentations);
    }

    public Profile getProfile() {
        return (Profile) getProperty(Profile.class);
    }

    public void setProfile(Profile profile) {
        setProperty(Profile.class, profile);
    }

    public Classification getClassification() {
        return (Classification) getProperty(Classification.class);
    }

    public void setClassification(Classification classification) {
        setProperty(Classification.class, classification);
    }

    public Classification setClassification(String classification) {
        Classification type = null;
        if (classification != null) {
            type = new Classification(classification);
        }
        setClassification(type);
        return type;
    }

    public List<Source> getSources() {
        return getProperties(Source.class);
    }

    public void addSource(Source source) {
        addProperty(source);
    }

    public Source addSource(String source) {
        Source type = new Source(source);
        addSource(type);
        return type;
    }

    public void addSourceAlt(Collection<Source> altRepresentations) {
        addPropertyAlt(Source.class, altRepresentations);
    }

    public void addSourceAlt(Source... altRepresentations) {
        addPropertyAlt(Source.class, altRepresentations);
    }

    public SourceDisplayText getSourceDisplayText() {
        return (SourceDisplayText) getProperty(SourceDisplayText.class);
    }

    public void setSourceDisplayText(SourceDisplayText sourceDisplayText) {
        setProperty(SourceDisplayText.class, sourceDisplayText);
    }

    public SourceDisplayText setSourceDisplayText(String sourceDisplayText) {
        SourceDisplayText type = null;
        if (sourceDisplayText != null) {
            type = new SourceDisplayText(sourceDisplayText);
        }
        setSourceDisplayText(type);
        return type;
    }

    public List<FormattedName> getFormattedNames() {
        return getProperties(FormattedName.class);
    }

    public FormattedName getFormattedName() {
        return (FormattedName) getProperty(FormattedName.class);
    }

    public void setFormattedNameAlt(Collection<FormattedName> altRepresentations) {
        setPropertyAlt(FormattedName.class, altRepresentations);
    }

    public void setFormattedNameAlt(FormattedName... altRepresentations) {
        setPropertyAlt(FormattedName.class, altRepresentations);
    }

    public void addFormattedNameAlt(Collection<FormattedName> altRepresentations) {
        addPropertyAlt(FormattedName.class, altRepresentations);
    }

    public void addFormattedNameAlt(FormattedName... altRepresentations) {
        addPropertyAlt(FormattedName.class, altRepresentations);
    }

    public void setFormattedName(FormattedName formattedName) {
        setProperty(FormattedName.class, formattedName);
    }

    public void addFormattedName(FormattedName formattedName) {
        addProperty(formattedName);
    }

    public FormattedName setFormattedName(String formattedName) {
        FormattedName type = null;
        if (formattedName != null) {
            type = new FormattedName(formattedName);
        }
        setFormattedName(type);
        return type;
    }

    public List<StructuredName> getStructuredNames() {
        return getProperties(StructuredName.class);
    }

    public StructuredName getStructuredName() {
        return (StructuredName) getProperty(StructuredName.class);
    }

    public void setStructuredNameAlt(Collection<StructuredName> altRepresentations) {
        setPropertyAlt(StructuredName.class, altRepresentations);
    }

    public void setStructuredNameAlt(StructuredName... altRepresentations) {
        setPropertyAlt(StructuredName.class, altRepresentations);
    }

    public void setStructuredName(StructuredName structuredName) {
        setProperty(StructuredName.class, structuredName);
    }

    public List<Nickname> getNicknames() {
        return getProperties(Nickname.class);
    }

    public Nickname getNickname() {
        return (Nickname) getProperty(Nickname.class);
    }

    public void setNicknameAlt(Collection<Nickname> altRepresentations) {
        setPropertyAlt(Nickname.class, altRepresentations);
    }

    public void setNicknameAlt(Nickname... altRepresentations) {
        setPropertyAlt(Nickname.class, altRepresentations);
    }

    public void addNicknameAlt(Collection<Nickname> altRepresentations) {
        addPropertyAlt(Nickname.class, altRepresentations);
    }

    public void addNicknameAlt(Nickname... altRepresentations) {
        addPropertyAlt(Nickname.class, altRepresentations);
    }

    public void setNickname(Nickname nickname) {
        setProperty(Nickname.class, nickname);
    }

    public void addNickname(Nickname nickname) {
        addProperty(nickname);
    }

    public Nickname setNickname(String... nicknames) {
        Nickname type = null;
        if (nicknames != null) {
            type = new Nickname();
            for (String nickname : nicknames) {
                type.addValue(nickname);
            }
        }
        setNickname(type);
        return type;
    }

    public SortString getSortString() {
        return (SortString) getProperty(SortString.class);
    }

    public void setSortString(SortString sortString) {
        setProperty(SortString.class, sortString);
    }

    public SortString setSortString(String sortString) {
        SortString type = null;
        if (sortString != null) {
            type = new SortString(sortString);
        }
        setSortString(type);
        return type;
    }

    public List<Title> getTitles() {
        return getProperties(Title.class);
    }

    public void addTitle(Title title) {
        addProperty(title);
    }

    public Title addTitle(String title) {
        Title type = new Title(title);
        addTitle(type);
        return type;
    }

    public void addTitleAlt(Collection<Title> altRepresentations) {
        addPropertyAlt(Title.class, altRepresentations);
    }

    public void addTitleAlt(Title... altRepresentations) {
        addPropertyAlt(Title.class, altRepresentations);
    }

    public List<Role> getRoles() {
        return getProperties(Role.class);
    }

    public void addRole(Role role) {
        addProperty(role);
    }

    public Role addRole(String role) {
        Role type = new Role(role);
        addRole(type);
        return type;
    }

    public void addRoleAlt(Collection<Role> altRepresentations) {
        addPropertyAlt(Role.class, altRepresentations);
    }

    public void addRoleAlt(Role... altRepresentations) {
        addPropertyAlt(Role.class, altRepresentations);
    }

    public List<Photo> getPhotos() {
        return getProperties(Photo.class);
    }

    public void addPhoto(Photo photo) {
        addProperty(photo);
    }

    public void addPhotoAlt(Collection<Photo> altRepresentations) {
        addPropertyAlt(Photo.class, altRepresentations);
    }

    public void addPhotoAlt(Photo... altRepresentations) {
        addPropertyAlt(Photo.class, altRepresentations);
    }

    public List<Logo> getLogos() {
        return getProperties(Logo.class);
    }

    public void addLogo(Logo logo) {
        addProperty(logo);
    }

    public void addLogoAlt(Collection<Logo> altRepresentations) {
        addPropertyAlt(Logo.class, altRepresentations);
    }

    public void addLogoAlt(Logo... altRepresentations) {
        addPropertyAlt(Logo.class, altRepresentations);
    }

    public List<Sound> getSounds() {
        return getProperties(Sound.class);
    }

    public void addSound(Sound sound) {
        addProperty(sound);
    }

    public void addSoundAlt(Collection<Sound> altRepresentations) {
        addPropertyAlt(Sound.class, altRepresentations);
    }

    public void addSoundAlt(Sound... altRepresentations) {
        addPropertyAlt(Sound.class, altRepresentations);
    }

    public List<Birthplace> getBirthplaces() {
        return getProperties(Birthplace.class);
    }

    public Birthplace getBirthplace() {
        return (Birthplace) getProperty(Birthplace.class);
    }

    public void setBirthplaceAlt(Collection<Birthplace> altRepresentations) {
        setPropertyAlt(Birthplace.class, altRepresentations);
    }

    public void setBirthplaceAlt(Birthplace... altRepresentations) {
        setPropertyAlt(Birthplace.class, altRepresentations);
    }

    public void setBirthplace(Birthplace birthplace) {
        setProperty(Birthplace.class, birthplace);
    }

    public List<Deathplace> getDeathplaces() {
        return getProperties(Deathplace.class);
    }

    public Deathplace getDeathplace() {
        return (Deathplace) getProperty(Deathplace.class);
    }

    public void setDeathplaceAlt(Collection<Deathplace> altRepresentations) {
        setPropertyAlt(Deathplace.class, altRepresentations);
    }

    public void setDeathplaceAlt(Deathplace... altRepresentations) {
        setPropertyAlt(Deathplace.class, altRepresentations);
    }

    public void setDeathplace(Deathplace deathplace) {
        setProperty(Deathplace.class, deathplace);
    }

    public List<Deathdate> getDeathdates() {
        return getProperties(Deathdate.class);
    }

    public Deathdate getDeathdate() {
        return (Deathdate) getProperty(Deathdate.class);
    }

    public void setDeathdateAlt(Collection<Deathdate> altRepresentations) {
        setPropertyAlt(Deathdate.class, altRepresentations);
    }

    public void setDeathdateAlt(Deathdate... altRepresentations) {
        setPropertyAlt(Deathdate.class, altRepresentations);
    }

    public void setDeathdate(Deathdate deathdate) {
        setProperty(Deathdate.class, deathdate);
    }

    public List<Birthday> getBirthdays() {
        return getProperties(Birthday.class);
    }

    public Birthday getBirthday() {
        return (Birthday) getProperty(Birthday.class);
    }

    public void setBirthdayAlt(Collection<Birthday> altRepresentations) {
        setPropertyAlt(Birthday.class, altRepresentations);
    }

    public void setBirthdayAlt(Birthday... altRepresentations) {
        setPropertyAlt(Birthday.class, altRepresentations);
    }

    public void setBirthday(Birthday birthday) {
        setProperty(Birthday.class, birthday);
    }

    public List<Anniversary> getAnniversaries() {
        return getProperties(Anniversary.class);
    }

    public Anniversary getAnniversary() {
        return (Anniversary) getProperty(Anniversary.class);
    }

    public void setAnniversaryAlt(Collection<Anniversary> altRepresentations) {
        setPropertyAlt(Anniversary.class, altRepresentations);
    }

    public void setAnniversaryAlt(Anniversary... altRepresentations) {
        setPropertyAlt(Anniversary.class, altRepresentations);
    }

    public void setAnniversary(Anniversary anniversary) {
        setProperty(Anniversary.class, anniversary);
    }

    public Revision getRevision() {
        return (Revision) getProperty(Revision.class);
    }

    public void setRevision(Revision rev) {
        setProperty(Revision.class, rev);
    }

    public Revision setRevision(Date rev) {
        Revision type = null;
        if (rev != null) {
            type = new Revision(rev);
        }
        setRevision(type);
        return type;
    }

    public ProductId getProductId() {
        return (ProductId) getProperty(ProductId.class);
    }

    public void setProductId(ProductId productId) {
        setProperty(ProductId.class, productId);
    }

    public ProductId setProductId(String productId) {
        ProductId type = null;
        if (productId != null) {
            type = new ProductId(productId);
        }
        setProductId(type);
        return type;
    }

    public List<Address> getAddresses() {
        return getProperties(Address.class);
    }

    public void addAddress(Address address) {
        addProperty(address);
    }

    public void addAddressAlt(Collection<Address> altRepresentations) {
        addPropertyAlt(Address.class, altRepresentations);
    }

    public void addAddressAlt(Address... altRepresentations) {
        addPropertyAlt(Address.class, altRepresentations);
    }

    public List<Label> getOrphanedLabels() {
        return getProperties(Label.class);
    }

    public void addOrphanedLabel(Label label) {
        addProperty(label);
    }

    public List<Email> getEmails() {
        return getProperties(Email.class);
    }

    public void addEmail(Email email) {
        addProperty(email);
    }

    public Email addEmail(String email, EmailType... types) {
        Email type = new Email(email);
        for (EmailType t : types) {
            type.addType(t);
        }
        addEmail(type);
        return type;
    }

    public void addEmailAlt(Collection<Email> altRepresentations) {
        addPropertyAlt(Email.class, altRepresentations);
    }

    public void addEmailAlt(Email... altRepresentations) {
        addPropertyAlt(Email.class, altRepresentations);
    }

    public List<Telephone> getTelephoneNumbers() {
        return getProperties(Telephone.class);
    }

    public void addTelephoneNumber(Telephone telephoneNumber) {
        addProperty(telephoneNumber);
    }

    public Telephone addTelephoneNumber(String telephoneNumber, TelephoneType... types) {
        Telephone type = new Telephone(telephoneNumber);
        for (TelephoneType t : types) {
            type.addType(t);
        }
        addTelephoneNumber(type);
        return type;
    }

    public void addTelephoneNumberAlt(Collection<Telephone> altRepresentations) {
        addPropertyAlt(Telephone.class, altRepresentations);
    }

    public void addTelephoneNumberAlt(Telephone... altRepresentations) {
        addPropertyAlt(Telephone.class, altRepresentations);
    }

    public Mailer getMailer() {
        return (Mailer) getProperty(Mailer.class);
    }

    public void setMailer(Mailer mailer) {
        setProperty(Mailer.class, mailer);
    }

    public Mailer setMailer(String mailer) {
        Mailer type = null;
        if (mailer != null) {
            type = new Mailer(mailer);
        }
        setMailer(type);
        return type;
    }

    public List<Url> getUrls() {
        return getProperties(Url.class);
    }

    public void addUrl(Url url) {
        addProperty(url);
    }

    public Url addUrl(String url) {
        Url type = new Url(url);
        addUrl(type);
        return type;
    }

    public void addUrlAlt(Collection<Url> altRepresentations) {
        addPropertyAlt(Url.class, altRepresentations);
    }

    public void addUrlAlt(Url... altRepresentations) {
        addPropertyAlt(Url.class, altRepresentations);
    }

    public List<Timezone> getTimezones() {
        return getProperties(Timezone.class);
    }

    public Timezone getTimezone() {
        return (Timezone) getProperty(Timezone.class);
    }

    public void setTimezoneAlt(Collection<Timezone> altRepresentations) {
        setPropertyAlt(Timezone.class, altRepresentations);
    }

    public void setTimezoneAlt(Timezone... altRepresentations) {
        setPropertyAlt(Timezone.class, altRepresentations);
    }

    public void addTimezoneAlt(Collection<Timezone> altRepresentations) {
        addPropertyAlt(Timezone.class, altRepresentations);
    }

    public void addTimezoneAlt(Timezone... altRepresentations) {
        addPropertyAlt(Timezone.class, altRepresentations);
    }

    public void setTimezone(Timezone timezone) {
        setProperty(Timezone.class, timezone);
    }

    public void addTimezone(Timezone timezone) {
        addProperty(timezone);
    }

    public List<Geo> getGeos() {
        return getProperties(Geo.class);
    }

    public Geo getGeo() {
        return (Geo) getProperty(Geo.class);
    }

    public void setGeoAlt(Collection<Geo> altRepresentations) {
        setPropertyAlt(Geo.class, altRepresentations);
    }

    public void addGeoAlt(Collection<Geo> altRepresentations) {
        addPropertyAlt(Geo.class, altRepresentations);
    }

    public void addGeoAlt(Geo... altRepresentations) {
        addPropertyAlt(Geo.class, altRepresentations);
    }

    public void setGeo(Geo geo) {
        setProperty(Geo.class, geo);
    }

    public void addGeo(Geo geo) {
        addProperty(geo);
    }

    public Geo setGeo(double latitude, double longitude) {
        Geo type = new Geo(Double.valueOf(latitude), Double.valueOf(longitude));
        setGeo(type);
        return type;
    }

    public List<Organization> getOrganizations() {
        return getProperties(Organization.class);
    }

    public Organization getOrganization() {
        return (Organization) getProperty(Organization.class);
    }

    public void setOrganizationAlt(Collection<Organization> altRepresentations) {
        setPropertyAlt(Organization.class, altRepresentations);
    }

    public void setOrganizationAlt(Organization... altRepresentations) {
        setPropertyAlt(Organization.class, altRepresentations);
    }

    public void addOrganizationAlt(Collection<Organization> altRepresentations) {
        addPropertyAlt(Organization.class, altRepresentations);
    }

    public void addOrganizationAlt(Organization... altRepresentations) {
        addPropertyAlt(Organization.class, altRepresentations);
    }

    public void setOrganization(Organization organization) {
        setProperty(Organization.class, organization);
    }

    public void addOrganization(Organization organization) {
        addProperty(organization);
    }

    public Organization setOrganization(String... departments) {
        Organization type = null;
        if (departments != null) {
            type = new Organization();
            for (String department : departments) {
                type.addValue(department);
            }
        }
        setOrganization(type);
        return type;
    }

    public List<Categories> getCategoriesList() {
        return getProperties(Categories.class);
    }

    public Categories getCategories() {
        return (Categories) getProperty(Categories.class);
    }

    public void setCategoriesAlt(Collection<Categories> altRepresentations) {
        setPropertyAlt(Categories.class, altRepresentations);
    }

    public void setCategoriesAlt(Categories... altRepresentations) {
        setPropertyAlt(Categories.class, altRepresentations);
    }

    public void addCategoriesAlt(Collection<Categories> altRepresentations) {
        addPropertyAlt(Categories.class, altRepresentations);
    }

    public void addCategoriesAlt(Categories... altRepresentations) {
        addPropertyAlt(Categories.class, altRepresentations);
    }

    public void setCategories(Categories categories) {
        setProperty(Categories.class, categories);
    }

    public void addCategories(Categories categories) {
        addProperty(categories);
    }

    public Categories setCategories(String... categories) {
        Categories type = null;
        if (categories != null) {
            type = new Categories();
            for (String category : categories) {
                type.addValue(category);
            }
        }
        setCategories(type);
        return type;
    }

    public Agent getAgent() {
        return (Agent) getProperty(Agent.class);
    }

    public void setAgent(Agent agent) {
        setProperty(Agent.class, agent);
    }

    public List<Note> getNotes() {
        return getProperties(Note.class);
    }

    public void addNote(Note note) {
        addProperty(note);
    }

    public Note addNote(String note) {
        Note type = new Note(note);
        addNote(type);
        return type;
    }

    public void addNoteAlt(Collection<Note> altRepresentations) {
        addPropertyAlt(Note.class, altRepresentations);
    }

    public void addNoteAlt(Note... altRepresentations) {
        addPropertyAlt(Note.class, altRepresentations);
    }

    public Uid getUid() {
        return (Uid) getProperty(Uid.class);
    }

    public void setUid(Uid uid) {
        setProperty(Uid.class, uid);
    }

    public List<Key> getKeys() {
        return getProperties(Key.class);
    }

    public void addKey(Key key) {
        addProperty(key);
    }

    public void addKeyAlt(Collection<Key> altRepresentations) {
        addPropertyAlt(Key.class, altRepresentations);
    }

    public void addKeyAlt(Key... altRepresentations) {
        addPropertyAlt(Key.class, altRepresentations);
    }

    public List<Impp> getImpps() {
        return getProperties(Impp.class);
    }

    public void addImpp(Impp impp) {
        addProperty(impp);
    }

    public void addImppAlt(Collection<Impp> altRepresentations) {
        addPropertyAlt(Impp.class, altRepresentations);
    }

    public void addImppAlt(Impp... altRepresentations) {
        addPropertyAlt(Impp.class, altRepresentations);
    }

    public List<Related> getRelations() {
        return getProperties(Related.class);
    }

    public void addRelated(Related related) {
        addProperty(related);
    }

    public void addRelatedAlt(Collection<Related> altRepresentations) {
        addPropertyAlt(Related.class, altRepresentations);
    }

    public void addRelatedAlt(Related... altRepresentations) {
        addPropertyAlt(Related.class, altRepresentations);
    }

    public List<Language> getLanguages() {
        return getProperties(Language.class);
    }

    public void addLanguage(Language language) {
        addProperty(language);
    }

    public Language addLanguage(String language) {
        Language type = new Language(language);
        addLanguage(type);
        return type;
    }

    public void addLanguageAlt(Collection<Language> altRepresentations) {
        addPropertyAlt(Language.class, altRepresentations);
    }

    public void addLanguageAlt(Language... altRepresentations) {
        addPropertyAlt(Language.class, altRepresentations);
    }

    public List<CalendarRequestUri> getCalendarRequestUris() {
        return getProperties(CalendarRequestUri.class);
    }

    public void addCalendarRequestUri(CalendarRequestUri calendarRequestUri) {
        addProperty(calendarRequestUri);
    }

    public void addCalendarRequestUriAlt(Collection<CalendarRequestUri> altRepresentations) {
        addPropertyAlt(CalendarRequestUri.class, altRepresentations);
    }

    public void addCalendarRequestUriAlt(CalendarRequestUri... altRepresentations) {
        addPropertyAlt(CalendarRequestUri.class, altRepresentations);
    }

    public List<CalendarUri> getCalendarUris() {
        return getProperties(CalendarUri.class);
    }

    public void addCalendarUri(CalendarUri calendarUri) {
        addProperty(calendarUri);
    }

    public void addCalendarUriAlt(Collection<CalendarUri> altRepresentations) {
        addPropertyAlt(CalendarUri.class, altRepresentations);
    }

    public void addCalendarUriAlt(CalendarUri... altRepresentations) {
        addPropertyAlt(CalendarUri.class, altRepresentations);
    }

    public List<FreeBusyUrl> getFbUrls() {
        return getProperties(FreeBusyUrl.class);
    }

    public void addFbUrl(FreeBusyUrl fbUrl) {
        addProperty(fbUrl);
    }

    public void addFbUrlAlt(Collection<FreeBusyUrl> altRepresentations) {
        addPropertyAlt(FreeBusyUrl.class, altRepresentations);
    }

    public void addFbUrlAlt(FreeBusyUrl... altRepresentations) {
        addPropertyAlt(FreeBusyUrl.class, altRepresentations);
    }

    public List<ClientPidMap> getClientPidMaps() {
        return getProperties(ClientPidMap.class);
    }

    public void addClientPidMap(ClientPidMap clientPidMap) {
        addProperty(clientPidMap);
    }

    public List<Xml> getXmls() {
        return getProperties(Xml.class);
    }

    public void addXml(Xml xml) {
        addProperty(xml);
    }

    public void addXmlAlt(Collection<Xml> altRepresentations) {
        addPropertyAlt(Xml.class, altRepresentations);
    }

    public void addXmlAlt(Xml... altRepresentations) {
        addPropertyAlt(Xml.class, altRepresentations);
    }

    public List<Expertise> getExpertise() {
        return getProperties(Expertise.class);
    }

    public void addExpertise(Expertise expertise) {
        addProperty(expertise);
    }

    public Expertise addExpertise(String expertise) {
        Expertise type = new Expertise(expertise);
        addExpertise(type);
        return type;
    }

    public void addExpertiseAlt(Collection<Expertise> altRepresentations) {
        addPropertyAlt(Expertise.class, altRepresentations);
    }

    public void addExpertiseAlt(Expertise... altRepresentations) {
        addPropertyAlt(Expertise.class, altRepresentations);
    }

    public List<Hobby> getHobbies() {
        return getProperties(Hobby.class);
    }

    public void addHobby(Hobby hobby) {
        addProperty(hobby);
    }

    public Hobby addHobby(String hobby) {
        Hobby type = new Hobby(hobby);
        addHobby(type);
        return type;
    }

    public void addHobbyAlt(Collection<Hobby> altRepresentations) {
        addPropertyAlt(Hobby.class, altRepresentations);
    }

    public void addHobbyAlt(Hobby... altRepresentations) {
        addPropertyAlt(Hobby.class, altRepresentations);
    }

    public List<Interest> getInterests() {
        return getProperties(Interest.class);
    }

    public void addInterest(Interest interest) {
        addProperty(interest);
    }

    public Interest addInterest(String interest) {
        Interest type = new Interest(interest);
        addInterest(type);
        return type;
    }

    public void addInterestAlt(Collection<Interest> altRepresentations) {
        addPropertyAlt(Interest.class, altRepresentations);
    }

    public void addInterestAlt(Interest... altRepresentations) {
        addPropertyAlt(Interest.class, altRepresentations);
    }

    public List<OrgDirectory> getOrgDirectories() {
        return getProperties(OrgDirectory.class);
    }

    public void addOrgDirectory(OrgDirectory orgDirectory) {
        addProperty(orgDirectory);
    }

    public OrgDirectory addOrgDirectory(String orgDirectory) {
        OrgDirectory type = new OrgDirectory(orgDirectory);
        addOrgDirectory(type);
        return type;
    }

    public void addOrgDirectoryAlt(Collection<OrgDirectory> altRepresentations) {
        addPropertyAlt(OrgDirectory.class, altRepresentations);
    }

    public void addOrgDirectoryAlt(OrgDirectory... altRepresentations) {
        addPropertyAlt(OrgDirectory.class, altRepresentations);
    }

    @Override // java.lang.Iterable
    public Iterator<VCardProperty> iterator() {
        return this.properties.values().iterator();
    }

    public <T extends VCardProperty> T getProperty(Class<T> clazz) {
        return clazz.cast(this.properties.first(clazz));
    }

    public <T extends VCardProperty> List<T> getProperties(Class<T> clazz) {
        List<VCardProperty> props = this.properties.get(clazz);
        List<T> ret = new ArrayList<>(props.size());
        for (VCardProperty property : props) {
            ret.add(clazz.cast(property));
        }
        return ret;
    }

    public <T extends VCardProperty & HasAltId> List<List<T>> getPropertiesAlt(Class<T> clazz) {
        ArrayList<VCardProperty> arrayList = new ArrayList();
        ListMultimap listMultimap = new ListMultimap();
        for (Object obj : getProperties(clazz)) {
            String altId = ((HasAltId) obj).getAltId();
            if (altId == null) {
                arrayList.add(obj);
            } else {
                listMultimap.put(altId, obj);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator i$ = listMultimap.iterator();
        while (i$.hasNext()) {
            Map.Entry<String, List<T>> entry = (Map.Entry) i$.next();
            arrayList2.add(entry.getValue());
        }
        for (VCardProperty vCardProperty : arrayList) {
            ArrayList arrayList3 = new ArrayList(1);
            arrayList3.add(vCardProperty);
            arrayList2.add(arrayList3);
        }
        return arrayList2;
    }

    public Collection<VCardProperty> getProperties() {
        return this.properties.values();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void addProperty(VCardProperty property) {
        this.properties.put(property.getClass(), property);
    }

    public <T extends VCardProperty> void setProperty(Class<T> clazz, T property) {
        this.properties.replace((ListMultimap<Class<? extends VCardProperty>, VCardProperty>) clazz, (Class<T>) property);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void removeProperty(VCardProperty property) {
        this.properties.remove(property.getClass(), property);
    }

    public void removeProperties(Class<? extends VCardProperty> clazz) {
        this.properties.removeAll(clazz);
    }

    public RawProperty getExtendedProperty(String name) {
        for (RawProperty raw : getProperties(RawProperty.class)) {
            if (raw.getPropertyName().equalsIgnoreCase(name)) {
                return raw;
            }
        }
        return null;
    }

    public List<RawProperty> getExtendedProperties(String name) {
        List<RawProperty> props = new ArrayList<>();
        for (RawProperty raw : getProperties(RawProperty.class)) {
            if (raw.getPropertyName().equalsIgnoreCase(name)) {
                props.add(raw);
            }
        }
        return props;
    }

    public List<RawProperty> getExtendedProperties() {
        return getProperties(RawProperty.class);
    }

    public RawProperty addExtendedProperty(String name, String value) {
        RawProperty raw = new RawProperty(name, value);
        addProperty(raw);
        return raw;
    }

    public RawProperty setExtendedProperty(String name, String value) {
        removeExtendedProperty(name);
        RawProperty raw = new RawProperty(name, value);
        addProperty(raw);
        return raw;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void removeExtendedProperty(String name) {
        List<RawProperty> xproperties = getExtendedProperties(name);
        for (RawProperty xproperty : xproperties) {
            this.properties.remove(xproperty.getClass(), xproperty);
        }
    }

    public <T extends VCardProperty & HasAltId> void addPropertyAlt(Class<T> propertyClass, T... altRepresentations) {
        addPropertyAlt(propertyClass, Arrays.asList(altRepresentations));
    }

    public <T extends VCardProperty & HasAltId> void addPropertyAlt(Class<T> propertyClass, Collection<T> altRepresentations) {
        String altId = generateAltId(getProperties(propertyClass));
        for (T property : altRepresentations) {
            property.setAltId(altId);
            addProperty(property);
        }
    }

    public <T extends VCardProperty & HasAltId> void setPropertyAlt(Class<T> propertyClass, T... altRepresentations) {
        setPropertyAlt(propertyClass, Arrays.asList(altRepresentations));
    }

    public <T extends VCardProperty & HasAltId> void setPropertyAlt(Class<T> propertyClass, Collection<T> altRepresentations) {
        removeProperties(propertyClass);
        addPropertyAlt(propertyClass, altRepresentations);
    }

    public ValidationWarnings validate(VCardVersion version) {
        ValidationWarnings warnings = new ValidationWarnings();
        if (getStructuredName() == null && (version == VCardVersion.V2_1 || version == VCardVersion.V3_0)) {
            warnings.add((VCardProperty) null, new Warning(0, new Object[0]));
        }
        if (getFormattedName() == null && (version == VCardVersion.V3_0 || version == VCardVersion.V4_0)) {
            warnings.add((VCardProperty) null, new Warning(1, new Object[0]));
        }
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            VCardProperty property = i$.next();
            List<Warning> propWarnings = property.validate(version, this);
            if (!propWarnings.isEmpty()) {
                warnings.add(property, propWarnings);
            }
        }
        return warnings;
    }

    static <T extends HasAltId> String generateAltId(Collection<T> properties) {
        Set<String> altIds = new HashSet<>();
        for (T property : properties) {
            String altId = property.getAltId();
            if (altId != null) {
                altIds.add(altId);
            }
        }
        int altId2 = 1;
        while (altIds.contains(altId2 + "")) {
            altId2++;
        }
        return altId2 + "";
    }
}
