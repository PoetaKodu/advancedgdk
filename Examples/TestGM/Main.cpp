#include "TestGMPCH.hpp"

// Advanced GDK library
#include <SAMP-EDGEngine/Everything.hpp>

#include <filesystem>

void cmd_TeleportToLocation(samp_edgengine::CommandInput input_)
{
	auto params = input_.splitParams();
	if (params.size() >= 3)
	{
		samp_edgengine::math::Vector3f location;
		location.x = samp_edgengine::text::ascii::convert<float>(params[0]).value();
		location.y = samp_edgengine::text::ascii::convert<float>(params[1]).value();
		location.z = samp_edgengine::text::ascii::convert<float>(params[2]).value();
		input_.target.setLocation(location);
		if (params.size() >= 5)
		{
			std::int32_t world		= samp_edgengine::text::ascii::convert<std::int32_t>(params[3]).value();
			std::int32_t interior	= samp_edgengine::text::ascii::convert<std::int32_t>(params[4]).value();
			input_.target.setWorld(world);
			input_.target.setInterior(interior);
		}
	}
}

void cmd_SpawnVehicle(samp_edgengine::CommandInput input_)
{
	auto params = input_.splitParams();
	if (params.size() == 1)
	{
		auto vehPtr = GameMode->Map.beginConstruction<samp_edgengine::Vehicle>();
		vehPtr->setModel(samp_edgengine::Vehicle::findModelBestMatch(params[0]));
		vehPtr->setLocation(input_.target.getLocation());
		vehPtr->setFacingAngle(input_.target.getFacingAngle());
		vehPtr->setInterior(input_.target.getInterior());
		vehPtr->setWorld(input_.target.getWorld());
		auto &veh = GameMode->Map.finalizeConstruction(vehPtr);
		input_.target.putInVehicle(veh, 0);
	}
}

void cmd_ObjectCount(samp_edgengine::CommandInput input_)
{
	namespace txt = samp_edgengine::text::ascii;
	auto tracker = static_cast<samp_edgengine::default_streamer::PlayerWrapper*>(input_.target.getPlacementTracker());
	GameMode->chat->messagePlayer(input_.target, txt::compose("You have currently ", tracker->spawnedObjects.size(), " objects shown!"));
}

class MyGameMode
	: public samp_edgengine::IGameMode
{
public:
	MyGameMode() {	
		this->addPlayerClass(0, { 280, 180, 1010 }, 0, { samp_edgengine::Weapon(samp_edgengine::Weapon::Deagle, 999) });
	}
	
	virtual void setup() override
	{
		samp_edgengine::IGameMode::setup();

		chat = std::make_unique<samp_edgengine::DefaultChat>();

		this->setupCommands();
		this->loadObjects();
	}

	void loadObjects()
	{
		namespace fs = std::filesystem;

		for (auto& file : fs::directory_iterator("data/objects"))
		{
			if (fs::is_regular_file(file))
			{
				std::clog << "[i]: Reading file: " << file.path() << std::endl;
				std::ifstream stream{ file };
				auto scene = GameMode->Map.beginConstruction<samp_edgengine::Scene>();

				scene->loadFromStream(stream, samp_edgengine::DefaultSceneLoader{});

				GameMode->Map.finalizeConstruction(scene);
			}
		}

	}

	virtual void setupEvents() override {
		Server->Events.PlayerSpawns += { *this, &MyGameMode::whenPlayerSpawns };
	}

	void whenPlayerSpawns(samp_edgengine::Player & player)
	{
		player.setLocation({ 1958.33f, 1343.12f, 15.36f });
		player.setWorld(0);
		player.addWeapon(samp_edgengine::Weapon(samp_edgengine::Weapon::Deagle, 999));
	}

	void setupCommands()
	{
		commands.construct<samp_edgengine::ProcedureCommand>( samp_edgengine::CmdInvocations{ "tpc" }, cmd_TeleportToLocation );
		commands.construct<samp_edgengine::ProcedureCommand>( samp_edgengine::CmdInvocations{ "v" }, cmd_SpawnVehicle );
		commands.construct<samp_edgengine::ProcedureCommand>( samp_edgengine::CmdInvocations{ "objc" }, cmd_ObjectCount);
	}

	virtual samp_edgengine::SharedPtr<samp_edgengine::Player> newPlayerInstance(std::size_t const playerIndex_) const override
	{
		return samp_edgengine::IGameMode::newPlayerInstance(playerIndex_);
	}
};

int main()
{
	Server->setup(std::make_unique<MyGameMode>());
}