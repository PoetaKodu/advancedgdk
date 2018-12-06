project "Engine"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	location (path.join(repoRoot, "Build/%{prj.name}"))
	targetdir (path.join(repoRoot, "Bin/%{cfg.platform}/%{cfg.buildcfg}"))

	includedirs {
		path.join(userConfig.deps.quickmaffs.root, "include"),
		userConfig.deps.sampgdk.root,
		"Include"
	}

	files {
		-- SAMPGDK files
		path.join(userConfig.deps.sampgdk.root, "sampgdk.c"),
		path.join(userConfig.deps.sampgdk.root, "amxplugin.cpp"),

		-- C++ files
		"include/SAMP-EDGEngine/Everything.hpp",
		"include/SAMP-EDGEngine/Core/Actions.hpp",
		"include/SAMP-EDGEngine/Core/BasicInterfacesInc.hpp",
		"include/SAMP-EDGEngine/Core/Clock.hpp",
		"include/SAMP-EDGEngine/Core/Color.hpp",
		"include/SAMP-EDGEngine/Core/ContainerInc.hpp",
		"include/SAMP-EDGEngine/Core/Events.hpp",
		"include/SAMP-EDGEngine/Core/Exceptions.hpp",
		"include/SAMP-EDGEngine/Core/Placement.hpp",
		"include/SAMP-EDGEngine/Core/Pointers.hpp",
		"include/SAMP-EDGEngine/Core/TextInc.hpp",
		"include/SAMP-EDGEngine/Core/TypesAndDefinitions.hpp",
		"include/SAMP-EDGEngine/Core/TypeTraits.hpp",
		"include/SAMP-EDGEngine/Core/BasicInterfaces/NonCopyable.hpp",
		"include/SAMP-EDGEngine/Core/BasicInterfaces/PlacementTracker.hpp",
		"include/SAMP-EDGEngine/Core/BasicInterfaces/Streamer.hpp",
		"include/SAMP-EDGEngine/Core/BasicInterfaces/Updatable.hpp",
		"include/SAMP-EDGEngine/Core/Container/DivisibleGrid2.hpp",
		"include/SAMP-EDGEngine/Core/Container/DivisibleGrid3.hpp",
		"include/SAMP-EDGEngine/Core/Text/ASCII.hpp",
		"include/SAMP-EDGEngine/Core/Text/Essentials.hpp",
		"include/SAMP-EDGEngine/Core/Text/StreamAlgorithm.hpp",
		"include/SAMP-EDGEngine/Core/Text/StreamLoader.hpp",
		"include/SAMP-EDGEngine/Core/Text/TokenIterator.hpp",
		"include/SAMP-EDGEngine/Dependencies/QuickMaffs.hpp",
		"include/SAMP-EDGEngine/Dependencies/SampGDK.hpp",
		"include/SAMP-EDGEngine/Server/Chat.hpp",
		"include/SAMP-EDGEngine/Server/Command.hpp",
		"include/SAMP-EDGEngine/Server/CommandManager.hpp",
		"include/SAMP-EDGEngine/Server/Dialog.hpp",
		"include/SAMP-EDGEngine/Server/GameMode.hpp",
		"include/SAMP-EDGEngine/Server/GlobalTextDraw.hpp",
		"include/SAMP-EDGEngine/Server/GlobalTextDrawPanel.hpp",
		"include/SAMP-EDGEngine/Server/Keyboard.hpp",
		"include/SAMP-EDGEngine/Server/Player.hpp",
		"include/SAMP-EDGEngine/Server/PlayerPool.hpp",
		"include/SAMP-EDGEngine/Server/PlayerTextDraw.hpp",
		"include/SAMP-EDGEngine/Server/PlayerTextDrawPanel.hpp",
		"include/SAMP-EDGEngine/Server/Server.hpp",
		"include/SAMP-EDGEngine/Server/Teleport.hpp",
		"include/SAMP-EDGEngine/Server/TextDraw.hpp",
		"include/SAMP-EDGEngine/Server/TextDrawOwner.hpp",
		"include/SAMP-EDGEngine/Server/Weapon.hpp",
		"include/SAMP-EDGEngine/World/3DNode.hpp",
		"include/SAMP-EDGEngine/World/Checkpoint.hpp",
		"include/SAMP-EDGEngine/World/GangZone.hpp",
		"include/SAMP-EDGEngine/World/GlobalObject.hpp",
		"include/SAMP-EDGEngine/World/Map.hpp",
		"include/SAMP-EDGEngine/World/MapObject.hpp",
		"include/SAMP-EDGEngine/World/PerPlayerObject.hpp",
		"include/SAMP-EDGEngine/World/PersonalObject.hpp",
		"include/SAMP-EDGEngine/World/Pickup.hpp",
		"include/SAMP-EDGEngine/World/RaceCheckpoint.hpp",
		"include/SAMP-EDGEngine/World/RemovedBuilding.hpp",
		"include/SAMP-EDGEngine/World/Scene.hpp",
		"include/SAMP-EDGEngine/World/UniversalObject.hpp",
		"include/SAMP-EDGEngine/World/Vehicle.hpp",
		"include/SAMP-EDGEngine/World/WI3DNode.hpp",
		"include/SAMP-EDGEngine/World/WI3DStreamableNode.hpp",
		"include/SAMP-EDGEngine/World/Streamer/CheckpointWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/Chunk.hpp",
		"include/SAMP-EDGEngine/World/Streamer/ChunkActor.hpp",
		"include/SAMP-EDGEngine/World/Streamer/GlobalActorWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/GlobalObjectWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/PersonalObjectWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/PlayerWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/RaceCheckpointWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/Streamer.hpp",
		"include/SAMP-EDGEngine/World/Streamer/StreamerSettings.hpp",
		"include/SAMP-EDGEngine/World/Streamer/UniversalObjectWrapper.hpp",
		"include/SAMP-EDGEngine/World/Streamer/VehicleWrapper.hpp",

		"src/Core/Actions.cpp",
		"src/Core/Clock.cpp",
		"src/Core/Color.cpp",
		"src/Core/BasicInterfaces/PlacementTracker.cpp",
		"src/Core/Text/ASCII.cpp",
		"src/Server/Chat.cpp",
		"src/Server/Command.cpp",
		"src/Server/CommandManager.cpp",
		"src/Server/Dialog.cpp",
		"src/Server/GameMode.cpp",
		"src/Server/GlobalTextDraw.cpp",
		"src/Server/GlobalTextDrawPanel.cpp",
		"src/Server/Keyboard.cpp",
		"src/Server/Player.cpp",
		"src/Server/PlayerPool.cpp",
		"src/Server/PlayerTextDraw.cpp",
		"src/Server/PlayerTextDrawPanel.cpp",
		"src/Server/Server.cpp",
		"src/Server/TextDraw.cpp",
		"src/Server/TextDrawOwner.cpp",
		"src/Server/Weapon.cpp",
		"src/World/3DNode.cpp",
		"src/World/Checkpoint.cpp",
		"src/World/GangZone.cpp",
		"src/World/GlobalObject.cpp",
		"src/World/Map.cpp",
		"src/World/MapObject.cpp",
		"src/World/PerPlayerObject.cpp",
		"src/World/PersonalObject.cpp",
		"src/World/RaceCheckpoint.cpp",
		"src/World/Scene.cpp",
		"src/World/UniversalObject.cpp",
		"src/World/Vehicle.cpp",
		"src/World/WI3DNode.cpp",
		"src/World/WI3DStreamableNode.cpp",
		"src/World/Streamer/CheckpointWrapper.cpp",
		"src/World/Streamer/Chunk.cpp",
		"src/World/Streamer/ChunkActor.cpp",
		"src/World/Streamer/GlobalActorWrapper.cpp",
		"src/World/Streamer/GlobalObjectWrapper.cpp",
		"src/World/Streamer/PersonalObjectWrapper.cpp",
		"src/World/Streamer/PlayerWrapper.cpp",
		"src/World/Streamer/Streamer.cpp",
		"src/World/Streamer/UniversalObjectWrapper.cpp",
		"src/World/Streamer/VehicleWrapper.cpp",
	}

	filter { "files:**.c" }
		compileas "C"
