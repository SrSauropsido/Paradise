//SKILL DEFINES
#define SKILL_CQC "cqc"
#define SKILL_MELEE_WEAPONS "melee_weapons"
#define SKILL_ENDURANCE "endurance"
#define SKILL_ENGINEER "engineer"
#define SKILL_MEDICAL "medical"
#define SKILL_RESEARCH "research"
#define SKILL_ANTAG "antag"
#define SKILL_MECHAS "mechas"

//CQC SKILL
#define SKILL_CQC_DEFAULT 0
#define SKILL_CQC_TRAINED 1
#define SKILL_CQC_SKILLED 2
#define SKILL_CQC_ERT 3

//MELEE WEAPON SKILL
#define SKILL_MELEE_DEFAULT 0
#define SKILL_MELEE_TRAINED 1
#define SKILL_MELEE_SUPER 2
#define SKILL_MELEE_ERT 3

//ENDURANCE SKILL
#define SKILL_ENDURANCE_DEFAULT 0
#define SKILL_ENDURANCE_WEAK 1
#define SKILL_ENDURANCE_TRAINED 2
#define SKILL_ENDURANCE_ERT 3

// ENGINEER SKILL
#define SKILL_ENGINEER_DEFAULT 0
#define SKILL_ENGINEER_TRAINED 1
#define SKILL_ENGINEER_ENGI 2
#define SKILL_ENGINEER_ERT 3

//MEDICAL SKILL
#define SKILL_MEDICAL_DEFAULT 0
#define SKILL_MEDICAL_TRAINED 1
#define SKILL_MEDICAL_MEDIC 2 //Clonacion/Virologia/Cryo
#define SKILL_MEDICAL_ERT 3

//RESEARCH SKILL
#define SKILL_RESEARCH_DEFAULT 0
#define SKILL_RESEARCH_TRAINED 1 //Quimica (Dispenser/Heater/Master)
#define SKILL_RESEARCH_MAX 2 //RnD Console
#define SKILL_RESEARCH_ERT 3

//ANTAG SKILL
#define SKILL_ANTAG_DEFAULT 0
#define SKILL_ANTAG_AGENT 1
#define SKILL_ANTAG_HUNTER 2
#define SKILL_ANTAG_MAX 3

//MECHAS SKILL
#define SKILL_MECHAS_DEFAULT 0
#define SKILL_MECHAS_TRAINED 1
#define SKILL_MECHAS_MASTER 2
#define SKILL_MECHAS_ERT 3

// Individual skill
/datum/skill
	var/skill_name = "Skill"
	var/skill_level = 0

/datum/skill/proc/get_skill_level()
	return skill_level

/datum/skill/proc/set_skill(new_level, mob/owner)
	skill_level = new_level

/datum/skill/proc/is_skilled(req_level, is_explicit = FALSE)
	if(is_explicit)
		return (skill_level == req_level)
	return (skill_level >= req_level)

/datum/skill/cqc
	skill_name = SKILL_CQC
	skill_level = SKILL_CQC_DEFAULT

/datum/skill/melee_weapons
	skill_name = SKILL_MELEE_WEAPONS
	skill_level = SKILL_MELEE_DEFAULT

/datum/skill/endurance
	skill_name = SKILL_ENDURANCE
	skill_level = SKILL_ENDURANCE_WEAK

/datum/skill/engineer
	skill_name = SKILL_ENGINEER
	skill_level = SKILL_ENGINEER_DEFAULT

/datum/skill/medical
	skill_name = SKILL_MEDICAL
	skill_level = SKILL_MEDICAL_DEFAULT

/datum/skill/research
	skill_name = SKILL_RESEARCH
	skill_level = SKILL_RESEARCH_DEFAULT

/datum/skill/antag
	skill_name = SKILL_ANTAG
	skill_level = SKILL_ANTAG_DEFAULT

/datum/skill/mechas
	skill_name = SKILL_MECHAS
	skill_level = SKILL_MECHAS_DEFAULT

/datum/skills
	var/name
	var/mob/living/carbon/owner = null
	var/list/skills = list()

/datum/skills/New(mob/skillset_owner)
	owner = skillset_owner

	for(var/skill_type in subtypesof(/datum/skill))
		var/datum/skill/S = new skill_type()
		var/predetermined_skill_level = skills[S.skill_name]
		skills[S.skill_name] = S

		if(!isnull(predetermined_skill_level))
			S.set_skill(predetermined_skill_level, owner)

/datum/skills/Destroy()
	owner = null

	for(var/datum/skill/S in skills)
		qdel(S)
		skills -= S

	return ..()

/datum/skills/proc/has_skill(skill)
	return isnull(skills[skill])

/datum/skills/proc/get_skill(skill)
	return skills[skill]

/datum/skills/proc/get_skill_level(skill)
	var/datum/skill/S = get_skill(skill)
	if(QDELETED(S))
		return -1
	return S.get_skill_level()

/datum/skills/proc/set_skill(skill, new_level)
	var/datum/skill/S = skills[skill]
	if(!S)
		return
	return S.set_skill(new_level, owner)

/datum/skills/proc/increment_skill(skill, increment, cap)
	var/datum/skill/S = skills[skill]
	if(!S || skillcheck(owner, skill, cap))
		return
	return S.set_skill(min(cap,S.skill_level+increment), owner)

/datum/skills/proc/decrement_skill(skill, increment)
	var/datum/skill/S = skills[skill]
	if(!S)
		return
	return S.set_skill(max(0,S.skill_level-increment), owner)

/datum/skills/proc/is_skilled(skill, req_level, is_explicit = FALSE)
	var/datum/skill/S = get_skill(skill)
	if(QDELETED(S))
		return FALSE
	return S.is_skilled(req_level, is_explicit)

/datum/skills/proc/set_skillset(skillset_type)
	var/datum/skills/skillset = new skillset_type()
	var/list/skill_levels = initial(skillset.skills)

	name = skillset.name
	for(var/skill in skill_levels)
		set_skill(skill, skill_levels[skill])
	qdel(skillset)

//Definiciones de Profesiones

/datum/skills/doctor //Doctor, Quimico, Genetista, Virologo
	name = "Medical Doctor"
	skills = list(
		SKILL_ENDURANCE = SKILL_ENDURANCE_DEFAULT,
		SKILL_MEDICAL = SKILL_MEDICAL_MEDIC,
		SKILL_RESEARCH = SKILL_RESEARCH_TRAINED,
		SKILL_MECHAS = SKILL_MECHAS_TRAINED
		)

/datum/skills/field_doctor //Paramedico
	name = "Field Doctor"
	skills = list(
		SKILL_ENDURANCE = SKILL_ENDURANCE_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_MEDIC,
		SKILL_RESEARCH = SKILL_RESEARCH_TRAINED,
		SKILL_MECHAS = SKILL_MECHAS_MASTER
		)

/datum/skills/engie //Ingeniero, Mecanico
	name = "Station Engie"
	skills = list(
		SKILL_ENDURANCE = SKILL_ENDURANCE_DEFAULT,
		SKILL_ENGINEER = SKILL_ENGINEER_ENGI,
		SKILL_MECHAS = SKILL_MECHAS_MASTER
			)

/datum/skills/scientist //Cientifico
	name = "Scientist"
	skills = list(
		SKILL_ENDURANCE = SKILL_ENDURANCE_DEFAULT,
		SKILL_RESEARCH = SKILL_RESEARCH_MAX,
		SKILL_MECHAS = SKILL_MECHAS_TRAINED
			)

/datum/skills/scientist //Roboticist
	name = "Roboticist"
	skills = list(
		SKILL_ENDURANCE = SKILL_ENDURANCE_DEFAULT,
		SKILL_RESEARCH = SKILL_RESEARCH_MAX,
		SKILL_MECHAS = SKILL_MECHAS_MASTER
			)
