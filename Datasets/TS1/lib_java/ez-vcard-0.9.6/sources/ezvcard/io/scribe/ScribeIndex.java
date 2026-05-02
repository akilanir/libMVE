package ezvcard.io.scribe;

import ezvcard.VCardVersion;
import ezvcard.property.RawProperty;
import ezvcard.property.VCardProperty;
import ezvcard.property.Xml;
import java.util.HashMap;
import java.util.Map;
import javax.xml.namespace.QName;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ScribeIndex.class */
public class ScribeIndex {
    private static final Map<String, VCardPropertyScribe<? extends VCardProperty>> standardByName = new HashMap();
    private static final Map<Class<? extends VCardProperty>, VCardPropertyScribe<? extends VCardProperty>> standardByClass = new HashMap();
    private static final Map<QName, VCardPropertyScribe<? extends VCardProperty>> standardByQName = new HashMap();
    private final Map<String, VCardPropertyScribe<? extends VCardProperty>> extendedByName = new HashMap(0);
    private final Map<Class<? extends VCardProperty>, VCardPropertyScribe<? extends VCardProperty>> extendedByClass = new HashMap(0);
    private final Map<QName, VCardPropertyScribe<? extends VCardProperty>> extendedByQName = new HashMap(0);

    static {
        registerStandard(new AddressScribe());
        registerStandard(new AgentScribe());
        registerStandard(new AnniversaryScribe());
        registerStandard(new BirthdayScribe());
        registerStandard(new CalendarRequestUriScribe());
        registerStandard(new CalendarUriScribe());
        registerStandard(new CategoriesScribe());
        registerStandard(new ClassificationScribe());
        registerStandard(new ClientPidMapScribe());
        registerStandard(new EmailScribe());
        registerStandard(new FreeBusyUrlScribe());
        registerStandard(new FormattedNameScribe());
        registerStandard(new GenderScribe());
        registerStandard(new GeoScribe());
        registerStandard(new ImppScribe());
        registerStandard(new KeyScribe());
        registerStandard(new KindScribe());
        registerStandard(new LabelScribe());
        registerStandard(new LanguageScribe());
        registerStandard(new LogoScribe());
        registerStandard(new MailerScribe());
        registerStandard(new MemberScribe());
        registerStandard(new NicknameScribe());
        registerStandard(new NoteScribe());
        registerStandard(new OrganizationScribe());
        registerStandard(new PhotoScribe());
        registerStandard(new ProductIdScribe());
        registerStandard(new ProfileScribe());
        registerStandard(new RelatedScribe());
        registerStandard(new RevisionScribe());
        registerStandard(new RoleScribe());
        registerStandard(new SortStringScribe());
        registerStandard(new SoundScribe());
        registerStandard(new SourceDisplayTextScribe());
        registerStandard(new SourceScribe());
        registerStandard(new StructuredNameScribe());
        registerStandard(new TelephoneScribe());
        registerStandard(new TimezoneScribe());
        registerStandard(new TitleScribe());
        registerStandard(new UidScribe());
        registerStandard(new UrlScribe());
        registerStandard(new XmlScribe());
        registerStandard(new BirthplaceScribe());
        registerStandard(new DeathdateScribe());
        registerStandard(new DeathplaceScribe());
        registerStandard(new ExpertiseScribe());
        registerStandard(new OrgDirectoryScribe());
        registerStandard(new InterestScribe());
        registerStandard(new HobbyScribe());
    }

    public VCardPropertyScribe<? extends VCardProperty> getPropertyScribe(String propertyName) {
        String propertyName2 = propertyName.toUpperCase();
        VCardPropertyScribe<? extends VCardProperty> marshaller = this.extendedByName.get(propertyName2);
        if (marshaller != null) {
            return marshaller;
        }
        return standardByName.get(propertyName2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean hasPropertyScribe(VCardProperty property) {
        return (property instanceof RawProperty) || getPropertyScribe((Class<? extends VCardProperty>) property.getClass()) != null;
    }

    public VCardPropertyScribe<? extends VCardProperty> getPropertyScribe(Class<? extends VCardProperty> clazz) {
        VCardPropertyScribe<? extends VCardProperty> marshaller = this.extendedByClass.get(clazz);
        if (marshaller != null) {
            return marshaller;
        }
        return standardByClass.get(clazz);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public VCardPropertyScribe<? extends VCardProperty> getPropertyScribe(VCardProperty property) {
        if (property instanceof RawProperty) {
            RawProperty raw = (RawProperty) property;
            return new RawPropertyScribe(raw.getPropertyName());
        }
        return getPropertyScribe((Class<? extends VCardProperty>) property.getClass());
    }

    public VCardPropertyScribe<? extends VCardProperty> getPropertyScribe(QName qname) {
        VCardPropertyScribe<? extends VCardProperty> marshaller = this.extendedByQName.get(qname);
        if (marshaller != null) {
            return marshaller;
        }
        VCardPropertyScribe<? extends VCardProperty> marshaller2 = standardByQName.get(qname);
        if (marshaller2 != null) {
            return marshaller2;
        }
        if (VCardVersion.V4_0.getXmlNamespace().equals(qname.getNamespaceURI())) {
            return new RawPropertyScribe(qname.getLocalPart().toUpperCase());
        }
        return getPropertyScribe(Xml.class);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void register(VCardPropertyScribe<? extends VCardProperty> scribe) {
        this.extendedByName.put(scribe.getPropertyName().toUpperCase(), scribe);
        this.extendedByClass.put(scribe.getPropertyClass(), scribe);
        this.extendedByQName.put(scribe.getQName(), scribe);
    }

    public void unregister(VCardPropertyScribe<? extends VCardProperty> scribe) {
        this.extendedByName.remove(scribe.getPropertyName().toUpperCase());
        this.extendedByClass.remove(scribe.getPropertyClass());
        this.extendedByQName.remove(scribe.getQName());
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static void registerStandard(VCardPropertyScribe<? extends VCardProperty> scribe) {
        standardByName.put(scribe.getPropertyName().toUpperCase(), scribe);
        standardByClass.put(scribe.getPropertyClass(), scribe);
        standardByQName.put(scribe.getQName(), scribe);
    }
}
